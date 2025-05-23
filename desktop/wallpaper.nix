{
  config,
  system,
  nix-wallpaper,
}: rec {
  package = with config.lib.stylix.colors.withHashtag;
    nix-wallpaper.packages.${system}.default.override {
      backgroundColor = base00;
      logoColors = {
        color0 = base08;
        color1 = base09;
        color2 = base0A;
        color3 = base0B;
        color4 = base0D;
        color5 = base0E;
      };
    };
  file = "${package}/share/wallpapers/nixos-wallpaper.png";
}
