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
            ./pi/configuration.nix
          ];
        };
      };
    };
}
