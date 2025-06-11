{
  description = "Liyua's System configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-raspberrypi.url = "github:nvmd/nixos-raspberrypi/main";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    extra-substituters = [
      "https://nixos-raspberrypi.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nixos-raspberrypi.cachix.org-1:4iMO9LXa8BqhU+Rpg6LQKiGa2lsNh/j2oiYLNOQ5sPI="
    ];
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
        rpi5-1 = mkSysConfig nixos-raspberrypi ./hosts/rpi5-1.nix;
        rpi5-2 = mkSysConfig nixos-raspberrypi ./hosts/rpi5-2.nix;
      };
      formatter = {
        x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;
        aarch64-linux = nixpkgs.legacyPackages.aarch64-linux.nixfmt-tree;
      };
    };
}
