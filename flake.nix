{
  description = "System configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @ { nixpkgs, disko, stylix, ... }: 
  let 
    system = "x86_64-linux";
  in {
    nixosConfigurations.liberty = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [ 
        disko.nixosModules.disko
        stylix.nixosModules.stylix
        ./shared.nix
        ./liberty/configuration.nix 
      ];
    };
  };
}
