{
  description = "System configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-raspberrypi.url = "github:nvmd/nixos-raspberrypi/main";
    disko = {
      url = "github:nix-community/disko";
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
      inputConfigs = with inputs; [ disko.nixosModules.disko ];
      mkSysConfig =
        mainRepo: cfg:
        mainRepo.lib.nixosSystem {
          specialArgs = inputs;
          modules = inputConfigs ++ [
            ./modules
            cfg
          ];
        };
    in
    {
      nixosConfigurations = {
        liberty = mkSysConfig nixpkgs ./hosts/liberty;
        linode = mkSysConfig nixpkgs ./hosts/linode;
        resolute = mkSysConfig nixpkgs ./hosts/resolute;
        rpi5-1 = mkSysConfig nixos-raspberrypi ./hosts/pi;
      };
      formatter = {
        x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;
        aarch64-linux = nixpkgs.legacyPackages.aarch64-linux.nixfmt-tree;
      };
    };
}
