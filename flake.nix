{
  description = "Home Manager configuration of liyua";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    tsserver-nixpkgs.url = "github:nixos/nixpkgs?rev=81bc281190c4955903d546169453f16c39908d58";
    hyprland.url = "github:hyprwm/Hyprland";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
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
    ags = {
      url = "github:ItsLiyua/ags/a1494ccaa5ef654333a2dbd10c18b1441ed03cee";
      # url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    stylix,
    nixvim,
    nix-wallpaper,
    nixcord,
    nur,
    ags,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    extraSpecialArgs = {
      inherit nixpkgs;
      inherit inputs;
      inherit system;
      inherit stylix;
      inherit nix-wallpaper;
      inherit nixcord;
      inherit nur;
      inherit ags;
    };
    sharedModules = [
      nur.modules.homeManager.default
      stylix.homeModules.stylix
      nixvim.homeManagerModules.nixvim
      nixcord.homeModules.nixcord
      ./shared.nix
    ];
  in {
    homeConfigurations."liyua@liberty" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      inherit extraSpecialArgs;
      modules = sharedModules ++ [./hosts/liberty.nix];
    };
  };
}
