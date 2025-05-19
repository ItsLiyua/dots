{ config, system, nix-wallpaper }: rec {
  package = nix-wallpaper.packages.${system}.default.override {
    backgroundColor = config.lib.stylix.colors.withHashtag.base00;
    logoColors = {
      color0 = config.lib.stylix.colors.withHashtag.base08;
      color1 = config.lib.stylix.colors.withHashtag.base09;
      color2 = config.lib.stylix.colors.withHashtag.base0A;
      color3 = config.lib.stylix.colors.withHashtag.base0B;
      color4 = config.lib.stylix.colors.withHashtag.base0D;
      color5 = config.lib.stylix.colors.withHashtag.base0E;
    };
  };
  file = "${package}/share/wallpapers/nixos-wallpaper.png";
}
