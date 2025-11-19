{
  description = "Liyua's System configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-raspberrypi.url = "github:nvmd/nixos-raspberrypi/main";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    flake-utils.url = "github:numtide/flake-utils";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixos-raspberrypi,
      home-manager,
      ...
    }@inputs:
    {
      nixosConfigurations =
        let
          flakeModules = with inputs; [
            disko.nixosModules.disko
            sops-nix.nixosModules.sops
          ];
        in
        {
          rocinante = nixpkgs.lib.nixosSystem {
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
            specialArgs = inputs // {
              myLib = import ./lib { inherit (nixpkgs) lib; };
            };
            modules = [
              ./hosts/common/core
              ./hosts/common/optional
              ./hosts/rocinante
            ]
            ++ flakeModules;
          };
        };
      homeConfigurations."liyua@rocinante" = { };
    };
}
