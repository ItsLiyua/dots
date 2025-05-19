{ config, lib, pkgs, stylix, nix-wallpaper, system, ... }: {
  home.packages = [ pkgs.base16-schemes ];
  gtk.enable = true;
  qt.enable = true;
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    polarity = "dark";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 16;
    };
    image = let
      pkg = nix-wallpaper.packages.${system}.default.override {
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
    in "${pkg}/share/wallpapers/nixos-wallpaper.png";
    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono Nerd Font";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
    # targets.firefox.colorTheme.enable = true;
  };
}
