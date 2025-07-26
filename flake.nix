{
  description = "Home Manager configuration of liyua";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
      # url = "github:ItsLiyua/ags/a1494ccaa5ef654333a2dbd10c18b1441ed03cee";
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprsplit = {
      url = "github:shezdy/hyprsplit";
      inputs.hyprland.follows = "hyprland";
    };
    nvf = {
      url = "github:notashelf/nvf?ref=pull/984/head";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nil_ls = {
      url = "github:oxalica/nil/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }@inputs:
    let
      extraSpecialArgs = inputs;
      pkgs-x86 = nixpkgs.legacyPackages.x86_64-linux;
      pkgs-amd64 = nixpkgs.legacyPackages.aarch64-linux;

      extraOverlays = [ inputs.niri.overlays.niri ];
      sharedModules = with inputs; [
        { nixpkgs.overlays = extraOverlays; }
        ./overlays

        ags.homeManagerModules.default
        hyprland.homeManagerModules.default
        nur.modules.homeManager.default
        stylix.homeModules.stylix
        nixcord.homeModules.nixcord
        nvf.homeManagerModules.default
        sops-nix.homeManagerModules.sops
        niri.homeModules.niri

        ./modules
      ];

      forAllSystems = nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
      ];

      mkHomeConfig =
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
        "liyua@liberty" = mkHomeConfig pkgs-x86 ./liyua/liberty.nix;
        "liyua@linode" = mkHomeConfig pkgs-x86 ./liyua/linode.nix;
        "liyua@resolute" = mkHomeConfig pkgs-x86 ./liyua/resolute.nix;
        "liyua@t480" = mkHomeConfig pkgs-x86 ./liyua/t480.nix;
        "liyua@rpi5-1" = mkHomeConfig pkgs-amd64 ./liyua/rpi5.nix;
        "liyua@rpi5-2" = mkHomeConfig pkgs-amd64 ./liyua/rpi5.nix;
      };
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-tree);
    };
}
