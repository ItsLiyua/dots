{
  description = "Home Manager configuration of liyua";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # tsserver-nixpkgs.url = "github:nixos/nixpkgs?rev=81bc281190c4955903d546169453f16c39908d58";
    hyprland.url = "github:hyprwm/Hyprland";
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
    hyprsplit = {
      url = "github:shezdy/hyprsplit";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }@inputs:
    let
      extraSpecialArgs = inputs;
      pkgs-x86 = nixpkgs.legacyPackages.x86_64-linux;
      pkgs-amd64 = nixpkgs.legacyPackages.aarch64-linux;
      sharedModules = with inputs; [
        ags.homeManagerModules.default
        hyprland.homeManagerModules.default
        nur.modules.homeManager.default
        stylix.homeModules.stylix
        nixcord.homeModules.nixcord

        ./modules
      ];

      mkHomeConfigLiyua =
        pkgs: cfg:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs extraSpecialArgs;
          modules = sharedModules ++ [
            ./liyua/common
            cfg
          ];
        };
    in
    {
      homeConfigurations = {
        "liyua@liberty" = mkHomeConfigLiyua pkgs-x86 ./liyua/liberty.nix;
        "liyua@linode" = mkHomeConfigLiyua pkgs-x86 ./liyua/linode.nix;
        "liyua@resolute" = mkHomeConfigLiyua pkgs-x86 ./liyua/resolute.nix;
        "liyua@rpi5-1" = mkHomeConfigLiyua pkgs-amd64 ./liyua/rpi5.nix;
      };
      formatter = {
        x86_64-linux = pkgs-x86.nixfmt-tree;
        aarch64-linux = pkgs-amd64.nixfmt-tree;
      };
    };
}
