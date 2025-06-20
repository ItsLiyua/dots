{
  description = "Liyua's System configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-raspberrypi.url = "github:nvmd/nixos-raspberrypi/main";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-minecraft = {
      url = "github:Infinidoge/nix-minecraft";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixos-raspberrypi,
      ...
    }@inputs:
    let
      inputConfigs = with inputs; [
        disko.nixosModules.disko
        sops-nix.nixosModules.sops
        nix-minecraft.nixosModules.minecraft-servers
      ];
      inputOverlays = with inputs; [
        nix-minecraft.overlay
      ];
      mkSysConfig =
        mainRepo: cfg:
        mainRepo.lib.nixosSystem {
          specialArgs = inputs;
          modules = inputConfigs ++ [
            { nixpkgs.overlays = inputOverlays; }
            ./hosts/common
            ./modules
            cfg
          ];
        };
      forAllSystems = nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
      ];
    in
    {
      nixosConfigurations = {
        liberty = mkSysConfig nixpkgs ./hosts/liberty;
        resolute = mkSysConfig nixpkgs ./hosts/resolute;
        t480 = mkSysConfig nixpkgs ./hosts/t480;
        rpi5-1 = mkSysConfig nixos-raspberrypi ./hosts/pi/rpi5-1.nix;
        rpi5-2 = mkSysConfig nixos-raspberrypi ./hosts/pi/rpi5-2.nix;
        linode = mkSysConfig nixpkgs ./hosts/linode;
      };
      formatter = forAllSystems (s: nixpkgs.legacyPackages.${s}.nixfmt-tree);
    };
}
