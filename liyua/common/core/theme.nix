{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.liyua.desktop.theming.enable;
in
{
  gtk.enable = lib.mkForce cfg;
  qt.enable = lib.mkForce cfg;
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/monokai.yaml";
    polarity = "dark";
    cursor = lib.mkIf cfg {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 16;
    };
    iconTheme = {
      enable = cfg;
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "blue";
      };
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };
    fonts = lib.mkIf cfg {
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
    targets = lib.mkIf cfg (
      {
        qt.enable = true;
        gtk.enable = true;
        firefox.colorTheme.enable = true;
      }
      // (lib.mkIf config.liyua.desktop.theming.enable {
        qt.enable = true;
        gtk.enable = true;
        font-packages.enable = true;
        fontconfig.enable = true;
      })
    );
  };
}
