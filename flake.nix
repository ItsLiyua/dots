{
  description = "Liyua's System configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-raspberrypi.url = "github:nvmd/nixos-raspberrypi/main";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    flake-utils.url = "github:numtide/flake-utils";
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-minecraft = {
      url = "github:Infinidoge/nix-minecraft";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plymouth-arasaka = {
      url = "gitlab:ItsLiyua/arasaka-plymouth";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    arasaka-greeter = {
      url = "github:ItsLiyua/arasaka-greeter";
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
    local-desktop-shell = {
      url = "path:packages/desktop-shell";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
      };
    };
    local-nvim = {
      url = "path:packages/nvim";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
      };
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixos-raspberrypi,
    home-manager,
    flake-utils,
    ...
  } @ inputs: let
    lib = nixpkgs.lib.extend (_: __: {liyua = import ./lib {inherit (nixpkgs) lib;};});

    systemModules = with inputs; [
      disko.nixosModules.disko
      sops-nix.nixosModules.sops
      nix-minecraft.nixosModules.minecraft-servers
      arasaka-greeter.nixosModules.default
    ];
    homeModules = with inputs; [
      hyprland.homeManagerModules.default
      nur.modules.homeManager.default
      stylix.homeModules.stylix
      nixcord.homeModules.nixcord
      sops-nix.homeManagerModules.sops
      niri.homeModules.niri
    ];
    overlays = system:
      with inputs; [
        niri.overlays.niri
        nix-minecraft.overlay
        plymouth-arasaka.overlays.${system}.default
        local-desktop-shell.overlays.${system}.default
        local-nvim.overlays.${system}.default
      ];

    mkSysConfig = mainRepo: architecture: entry:
      mainRepo.lib.nixosSystem {
        specialArgs = inputs;
        modules =
          systemModules
          ++ [
            ./modules/system
            {nixpkgs.overlays = overlays architecture;}
            ./hosts/common
            ./hosts/shared.nix
            entry
          ];
      };
    mkHomeConfig = mainRepo: architecture: entry:
      home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = inputs;
        pkgs = mainRepo.legacyPackages.${architecture};
        modules =
          homeModules
          ++ [
            ./modules/user
            {nixpkgs.overlays = overlays architecture;}
            ./liyua/common
            entry
          ];
      };
  in
    {
      nixosConfigurations = {
        liberty = mkSysConfig nixpkgs "x86_64-linux" ./hosts/liberty;
        resolute = mkSysConfig nixpkgs "x86_64-linux" ./hosts/resolute;
        t480 = mkSysConfig nixpkgs "x86_64-linux" ./hosts/t480;
        rpi5-1 = mkSysConfig nixos-raspberrypi "aarch64-linux" ./hosts/pi/rpi5-1;
        rpi5-2 = mkSysConfig nixos-raspberrypi "aarch64-linux" ./hosts/pi/rpi5-2;
        linode = mkSysConfig nixpkgs "x86_64-linux" ./hosts/linode;
      };
      homeConfigurations = {
        "liyua@liberty" = mkHomeConfig nixpkgs "x86_64-linux" ./liyua/liberty.nix;
        "liyua@linode" = mkHomeConfig nixpkgs "x86_64-linux" ./liyua/linode.nix;
        "liyua@resolute" = mkHomeConfig nixpkgs "x86_64-linux" ./liyua/resolute.nix;
        "liyua@t480" = mkHomeConfig nixpkgs "x86_64-linux" ./liyua/t480.nix;
        "liyua@rpi5-1" = mkHomeConfig nixos-raspberrypi "aarch64-linux" ./liyua/rpi5.nix;
        "liyua@rpi5-2" = mkHomeConfig nixos-raspberrypi "aarch64-linux" ./liyua/rpi5.nix;
      };
      overlays = import ./overlays {inherit (nixpkgs) lib;};
    }
    // flake-utils.lib.eachDefaultSystem (s: {
      formatter = nixpkgs.legacyPackages.${s}.nixfmt-tree;
    });
}
