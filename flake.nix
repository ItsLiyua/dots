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
        rpi5-1 = nixos-raspberrypi.lib.nixosSystem {
          specialArgs = inputs;
          modules = [
            {
              imports = with nixos-raspberrypi.nixosModules; [
                raspberry-pi-5.base
                raspberry-pi-5.display-vc4
                raspberry-pi-5.bluetooth
                ./pi-disko.nix
              ];
            }
            (
              {
                config,
                lib,
                pkgs,
                ...
              }:
              {
                networking.hostname = "rpi5-1";
                nix.settings = {
                  substituters = [ "https://nixos-raspberrypi.cachix.org" ];
                  trusted-public-keys = [
                    "nixos-raspberrypi.cachix.org-1:4iMO9LXa8BqhU+Rpg6LQKiGa2lsNh/j2oiYLNOQ5sPI="
                  ];
                };

                system.nixos.tags =
                  let
                    cfg = config.boot.loader.raspberryPi;
                  in
                  [
                    "raspberry-pi-${cfg.variant}"
                    cfg.bootlaoder
                    config.boot.kernelPackages.kernel.version
                  ];
              }
            )
          ];
        };
      };
      formatter = {
        x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;
        aarch64-linux = nixpkgs.legacyPackages.aarch64-linux.nixfmt-tree;
      };
    };
}
