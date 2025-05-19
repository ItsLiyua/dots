{
  description = "Home Manager configuration of liyua";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-wallpaper = {
      url = "github:lunik1/nix-wallpaper";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord = {
      url = "github:kaylorben/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, stylix, nixvim, nix-wallpaper, nixcord, ... } @ inputs:
    let
      system = "x86_64-linux";
    in {
      homeConfigurations."liyua" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = { 
          inherit nixpkgs;
          inherit inputs; 
          inherit system; 
          inherit stylix;
          inherit nix-wallpaper; 
          inherit nixcord;
        };
        modules = [ 
          stylix.homeModules.stylix
          nixvim.homeManagerModules.nixvim
          nixcord.homeModules.nixcord
          ./home.nix
        ];
      };
    };
}
