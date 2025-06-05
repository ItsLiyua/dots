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

  nixConfig = {
    extra-substituters = [ "https://nixos-raspberrypi.cachix.org" ];
    extra-trusted-public-keys = [
      "nixos-raspberrypi.cachix.org-1:4iMO9LXa8BqhU+Rpg6LQKiGa2lsNh/j2oiYLNOQ5sPI="
    ];
  };

  outputs = inputs@{ nixpkgs, disko, nixos-raspberrypi, ... }:
    let system = "x86_64-linux";
    in {
      nixosConfigurations = {
        liberty = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [ ./shared.nix ./liberty/configuration.nix ];
        };
        linode = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [ ./shared.nix ./linode/configuration.nix ];
        };
        resolute = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [ ./shared.nix ./resolute/configuration.nix ];
        };

        rpi5-1 = nixos-raspberrypi.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            nixos-raspberrypi = inputs.nixos-raspberrypi;
          };
          modules = [
            ./shared.nix
            ({ config, ... }: {
              config.liyua = {
                audio.enable = false;
                bootloader.enable = false;
                extras.dconf.enable = false;
                fonts.enable = false;
                gaming.enable = false;
                greeter.enable = false;
                libinput.enable = false;
                logind.enable = false;
                waylandNativeOzone.enable = false;
              };
            })
            ({ inputs, ... }: {
              imports = with inputs.nixos-raspberrypi.nixosModules; [
                raspberry-pi-5.base
                raspberry-pi-5.bluetooth
              ];
            })
            ({ ... }: { imports = [ ./disko.nix ]; })
            ({ ... }: {
              networking.hostName = "rpi5-1";
              system.stateVersion = "25.05";
            })
          ];
        };
      };
    };
}
