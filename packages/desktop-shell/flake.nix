{
  description = "My Awesome Desktop Shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ags,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pname = "desktop-shell";
        pkgs = nixpkgs.legacyPackages.${system};
        astalPackages = with ags.packages.${system}; [
          io
          astal4
        ];

        extraPackages = astalPackages ++ [
          pkgs.libadwaita
          pkgs.libsoup_3
        ];
      in
      {
        packages.default = pkgs.stdenv.mkDerivation {
          inherit pname;
          version = "1.0";
          src = ./.;

          nativeBuildInputs = with pkgs; [
            wrapGAppsHook
            gobject-introspection
            ags.packages.${system}.default
          ];

          buildInputs = extraPackages ++ [ pkgs.gjs ];

          installPhase = ''
            runHook preInstall

            mkdir -p $out/bin
            mkdir -p $out/share
            cp -r * $out/share
            ags bundle app.ts $out/bin/${pname} -d "SRC='$out/share'"

            runHook postInstall
          '';
        };
        overlays.default = final: prev: { liyua.${pname} = self.packages.${system}.default; };
        devShells.default = pkgs.mkShell {
          buildInputs = [
            (ags.packages.${system}.default.override {
              inherit extraPackages;
            })
          ];
        };
      }
    );
}
