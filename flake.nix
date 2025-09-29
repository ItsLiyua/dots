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
    nix-minecraft = {
      url = "github:Infinidoge/nix-minecraft";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plymouth-arasaka = {
      url = "github:ItsLiyua/arasaka-plymouth";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    arasaka-greeter = {
      url = "github:ItsLiyua/arasaka-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.ags.follows = "ags";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
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
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs";
    };
    nil_ls = {
      url = "github:oxalica/nil/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-userstyles = {
      url = "github:knoopx/nix-userstyles";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixos-raspberrypi,
      home-manager,
      flake-utils,
      ...
    }@inputs:
    let

      mkSysConfig =
        mainRepo: inputs: extraModules: entry: hostName:
        mainRepo.lib.nixosSystem (
          let
            myLib = import ./lib {
              inherit (nixpkgs) lib;
              liyua.spec.hostName = hostName;
            };
          in
          {
            specialArgs = inputs // {
              inherit myLib;
            };
            modules = extraModules ++ [
              (myLib.relativeToRoot "modules/system")
              (myLib.relativeToRoot "hosts/common")
              entry
            ];
          }
        );

      mkHomeConfig =
        pkgs: inputs: extraModules: entry: userName: hostName:
        inputs.home-manager.lib.homeManagerConfiguration (
          let
            myLib = import ./lib {
              inherit (nixpkgs) lib;
              liyua.spec = {
                hostName = hostName;
                user.name = userName;
              };
            };
          in
          {
            inherit pkgs;
            extraSpecialArgs = inputs // {
              inherit myLib;
            };
            modules = extraModules ++ [
              (myLib.relativeToRoot "modules/user")
              (myLib.relativeToRoot "home/liyua/common")
              entry
            ];
          }
        );

      overlays = {
        nixpkgs.overlays = with inputs; [
          niri.overlays.niri
          nix-minecraft.overlay
          (import ./overlays inputs)
        ];
      };

      systemModules = with inputs; [
        overlays
        disko.nixosModules.disko
        sops-nix.nixosModules.sops
        nix-minecraft.nixosModules.minecraft-servers
        arasaka-greeter.nixosModules.default
      ];

      homeModules = with inputs; [
        overlays
        sops-nix.homeManagerModules.sops
        stylix.homeModules.stylix
        nixcord.homeModules.nixcord
        niri.homeModules.niri
      ];

      x86_64 = nixpkgs.legacyPackages.x86_64-linux;
      aarch64 = nixpkgs.legacyPackages.aarch64-linux;

      mkDefaultSysConfig = mkSysConfig nixpkgs inputs systemModules;
      mkDefaultHomeConfig = mkHomeConfig x86_64 inputs homeModules;
    in
    {
      nixosConfigurations = {
        liberty = mkDefaultSysConfig ./hosts/liberty "liberty"; # Razorback
        donnager = mkDefaultSysConfig ./hosts/donnager "donnager";
        rocinante = mkDefaultSysConfig ./hosts/rocinante "rocinante";
        eros = mkSysConfig nixos-raspberrypi inputs systemModules ./hosts/pi/eros "eros";
        ceres = mkSysConfig nixos-raspberrypi inputs systemModules ./hosts/pi/ceres "ceres";
        medina = mkDefaultSysConfig ./hosts/medina "medina"; # Medina
        ganymede = mkDefaultSysConfig ./hosts/ganymede "ganymede";
      };
      homeConfigurations = {
        "liyua@liberty" = mkDefaultHomeConfig ./home/liyua/liberty.nix "liyua" "liberty";
        "liyua@medina" = mkDefaultHomeConfig ./home/liyua/medina.nix "liyua" "medina";
        "liyua@donnager" = mkDefaultHomeConfig ./home/liyua/donnager.nix "liyua" "donnager";
        "liyua@rocinante" = mkDefaultHomeConfig ./home/liyua/rocinante.nix "liyua" "rocinante";
        "liyua@eros" = mkHomeConfig aarch64 inputs homeModules ./home/liyua/rpi5.nix "liyua" "eros";
        "liyua@ceres" = mkHomeConfig aarch64 inputs homeModules ./home/liyua/rpi5.nix "liyua" "ceres";
        "liyua@ganymede" = mkDefaultHomeConfig ./home/liyua/ganymede.nix "liyua" "ganymede";
      };
      overlays = import ./overlays { inherit (nixpkgs) lib; };
    }
    // flake-utils.lib.eachDefaultSystem (
      s:
      (
        let
          pkgs = nixpkgs.legacyPackages.${s};
        in
        {
          formatter = nixpkgs.legacyPackages.${s}.nixfmt-tree;
          packages = {
            nvim = import ./packages/nvim/package.nix {
              inherit (inputs) nvf;
              inherit pkgs;
            };
            desktop-shell = pkgs.callPackage ./packages/desktop-shell/package.nix { inherit (inputs) ags; };
          };
          devShells = {
            default = import ./shell.nix { inherit self pkgs; };
            ags = import ./packages/desktop-shell/shell.nix { inherit self pkgs inputs; };
          };
        }
      )
    );
}
