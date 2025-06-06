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
    {
      nixosConfigurations = {
        liberty = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./shared.nix
            ./liberty/configuration.nix
          ];
        };
        linode = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./shared.nix
            ./linode/configuration.nix
          ];
        };
        resolute = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./shared.nix
            ./resolute/configuration.nix
          ];
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
      formatter = {
        x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;
        aarch64-linux = nixpkgs.legacyPackages.aarch64-linux.nixfmt-tree;
      };
    };
}
