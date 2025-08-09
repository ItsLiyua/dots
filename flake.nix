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
    nix-userstyles = {
      url = "github:knoopx/nix-userstyles";
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
      # lib = nixpkgs.lib.extend (_: _: { liyua = import ./lib { inherit (nixpkgs) lib; }; });

      systemModules = with inputs; [
        disko.nixosModules.disko
        sops-nix.nixosModules.sops
        nix-minecraft.nixosModules.minecraft-servers
        arasaka-greeter.nixosModules.default
      ];
      homeModules = with inputs; [
        stylix.homeModules.stylix
        nixcord.homeModules.nixcord
        sops-nix.homeManagerModules.sops
        niri.homeModules.niri
      ];
      overlays =
        system: with inputs; [
          niri.overlays.niri
          nix-minecraft.overlay
          plymouth-arasaka.overlays.${system}.default
          (import ./overlays/common { inherit (nixpkgs) lib; })
        ];

      fetchExtraOverlays =
        arch: overlayPath:
        if overlayPath != null then
          [
            (import overlayPath {
              inherit arch;
              inherit (nixpkgs) lib;
            })
          ]
        else
          [ ];

      mkSysConfig =
        mainRepo: architecture: entry: extraOverlays:
        mainRepo.lib.nixosSystem {
          specialArgs = inputs // {
            # inherit lib;
          };
          modules = systemModules ++ [
            ./modules/system
            { nixpkgs.overlays = (overlays architecture) ++ (fetchExtraOverlays architecture extraOverlays); }
            ./hosts/common
            ./hosts/shared.nix
            entry
          ];
        };
      mkHomeConfig =
        mainRepo: architecture: entry: extraOverlays:
        home-manager.lib.homeManagerConfiguration {
          extraSpecialArgs = inputs // {
            # lib = lib.extend (_: _: home-manager.lib);
          };
          pkgs = mainRepo.legacyPackages.${architecture};
          modules = homeModules ++ [
            ./modules/user
            { nixpkgs.overlays = (overlays architecture) ++ (fetchExtraOverlays architecture extraOverlays); }
            ./home/liyua/common
            entry
          ];
        };
    in
    {
      nixosConfigurations = {
        liberty = mkSysConfig nixpkgs "x86_64-linux" ./hosts/liberty null;
        resolute = mkSysConfig nixpkgs "x86_64-linux" ./hosts/resolute ./overlays/resolute;
        t480 = mkSysConfig nixpkgs "x86_64-linux" ./hosts/t480 null;
        rpi5-1 = mkSysConfig nixos-raspberrypi "aarch64-linux" ./hosts/pi/rpi5-1 null;
        rpi5-2 = mkSysConfig nixos-raspberrypi "aarch64-linux" ./hosts/pi/rpi5-2 null;
        linode = mkSysConfig nixpkgs "x86_64-linux" ./hosts/linode null;
      };
      homeConfigurations = {
        "liyua@liberty" = mkHomeConfig nixpkgs "x86_64-linux" ./home/liyua/liberty.nix null;
        "liyua@linode" = mkHomeConfig nixpkgs "x86_64-linux" ./home/liyua/linode.nix null;
        "liyua@resolute" =
          mkHomeConfig nixpkgs "x86_64-linux" ./home/liyua/resolute.nix
            ./overlays/resolute;
        "liyua@t480" = mkHomeConfig nixpkgs "x86_64-linux" ./home/liyua/t480.nix null;
        "liyua@rpi5-1" = mkHomeConfig nixos-raspberrypi "aarch64-linux" ./home/liyua/rpi5.nix null;
        "liyua@rpi5-2" = mkHomeConfig nixos-raspberrypi "aarch64-linux" ./home/liyua/rpi5.nix null;
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
            default = pkgs.mkShell {
              packages = [
                self.packages.${s}.nvim
                pkgs.sops
                pkgs.ssh-to-age
                pkgs.just # TODO: Create a justfile for easier usage
                pkgs.nh
              ];
              shellHook = ''
                echo Hello World!
              '';
            };
            ags = pkgs.mkShell {
              buildInputs = [
                (inputs.ags.packages.${s}.default.override {
                  inherit (self.packages.${s}.desktop-shell) extraPackages;
                })
              ];
            };
          };
        }
      )
    );
}
