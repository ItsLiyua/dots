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
      myLib = import ./lib { inherit (nixpkgs) lib; };

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

      mkDefaultSysConfig = myLib.mkSysConfig nixpkgs inputs systemModules;
      mkDefaultHomeConfig = myLib.mkHomeConfig x86_64 inputs homeModules;
    in
    {
      nixosConfigurations = with myLib; {
        liberty = mkDefaultSysConfig ./hosts/liberty; # Razorback
        donnager = mkDefaultSysConfig ./hosts/donnager;
        t480 = mkDefaultSysConfig ./hosts/t480; # Rocinante
        rpi5-1 = mkSysConfig nixos-raspberrypi inputs systemModules ./hosts/pi/rpi5-1; # Phobos
        rpi5-2 = mkSysConfig nixos-raspberrypi inputs systemModules ./hosts/pi/rpi5-2; # Deimos
        linode = mkDefaultSysConfig ./hosts/linode; # Medina
        ganymede = mkDefaultSysConfig ./hosts/ganymede;
      };
      homeConfigurations = {
        "liyua@liberty" = mkDefaultHomeConfig ./home/liyua/liberty.nix;
        "liyua@linode" = mkDefaultHomeConfig ./home/liyua/linode.nix;
        "liyua@donnager" = mkDefaultHomeConfig ./home/liyua/donnager.nix;
        "liyua@t480" = mkDefaultHomeConfig ./home/liyua/t480.nix;
        "liyua@rpi5-1" = myLib.mkHomeConfig aarch64 inputs homeModules ./home/liyua/rpi5.nix;
        "liyua@rpi5-2" = myLib.mkHomeConfig aarch64 inputs homeModules ./home/liyua/rpi5.nix;
        "liyua@ganymede" = mkDefaultHomeConfig ./home/liyua/ganymede.nix;
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
