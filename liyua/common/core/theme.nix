{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = {
    stylix = {
      enable = true;
      autoEnable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
      polarity = "dark";
    };
  };
  # // (lib.mkIf config.liyua.desktop.theming.enable {
  #   gtk.enable = true;
  #   qt.enable = true;
  #   stylix = {
  #     cursor = {
  #       package = pkgs.bibata-cursors;
  #       name = "Bibata-Modern-Ice";
  #       size = 16;
  #     };
  #     iconTheme = {
  #       enable = true;
  #       package = pkgs.catppuccin-papirus-folders.override {
  #         flavor = "mocha";
  #         accent = "blue";
  #       };
  #       dark = "Papirus-Dark";
  #       light = "Papirus-Light";
  #     };
  #     fonts = {
  #       serif = {
  #         package = pkgs.dejavu_fonts;
  #         name = "DejaVu Serif";
  #       };
  #       sansSerif = {
  #         package = pkgs.dejavu_fonts;
  #         name = "DejaVu Sans";
  #       };
  #       monospace = {
  #         package = pkgs.nerd-fonts.jetbrains-mono;
  #         name = "JetBrains Mono Nerd Font";
  #       };
  #       emoji = {
  #         package = pkgs.noto-fonts-emoji;
  #         name = "Noto Color Emoji";
  #       };
  #     };
  #     targets = {
  #       qt.enable = true;
  #       gtk.enable = true;
  #       firefox.colorTheme.enable = true;
  #     };
  #   };
  # });
}
