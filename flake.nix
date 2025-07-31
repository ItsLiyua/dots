{
  description = "Home Manager configuration of liyua";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    hyprland.url = "github:hyprwm/Hyprland";
    liyua = {
      url = "github:ItsLiyua/dots/system";
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
    nix-userstyles = {
      url = "github:knoopx/nix-userstyles";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    local-my-shell = {
      url = "path:packages/my-shell";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
      };
    };
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      home-manager,
      ...
    }@inputs:
    let
      extraOverlays = with inputs; [
        liyua.overlays.default
        niri.overlays.niri
      ];

      x86Overlays = with inputs; [ local-my-shell.overlays.x86_64-linux.default ];
      amd64Overlays = with inputs; [ local-my-shell.overlays.aarch64-linux.default ];

      sharedModules = with inputs; [
        { nixpkgs.overlays = extraOverlays; }
        hyprland.homeManagerModules.default
        nur.modules.homeManager.default
        stylix.homeModules.stylix
        nixcord.homeModules.nixcord
        nvf.homeManagerModules.default
        sops-nix.homeManagerModules.sops
        niri.homeModules.niri

        ./modules
      ];

      mkHomeConfig =
        type: cfg:
        home-manager.lib.homeManagerConfiguration {
          extraSpecialArgs = inputs;
          pkgs =
            nixpkgs.legacyPackages.${
              if type == "x86" then
                "x86_64-linux"
              else if type == "pi" then
                "aarch64-linux"
              else
                throw "Invalid type for home config given!"
            };
          modules = sharedModules ++ [
            {
              nixpkgs.overlays =
                if type == "x86" then
                  x86Overlays
                else if type == "pi" then
                  amd64Overlays
                else
                  throw "Invalid architecture given for home config!";
            }
            ./liyua/common
            cfg
          ];
        };
    in
    flake-utils.lib.eachDefaultSystem (system: {
      formatter = nixpkgs.legacyPackages.${system}.nixfmt-tree;
      packages.liyua-desktop-shell = inputs.local-my-shell.packages.${system}.default;
    })
    // {
      homeConfigurations = {
        "liyua@liberty" = mkHomeConfig "x86" ./liyua/liberty.nix;
        "liyua@linode" = mkHomeConfig "x86" ./liyua/linode.nix;
        "liyua@resolute" = mkHomeConfig "x86" ./liyua/resolute.nix;
        "liyua@t480" = mkHomeConfig "x86" ./liyua/t480.nix;
        "liyua@rpi5-1" = mkHomeConfig "pi " ./liyua/rpi5.nix;
        "liyua@rpi5-2" = mkHomeConfig "pi " ./liyua/rpi5.nix;
      };
    };
}
