{
  config,
  lib,
  pkgs,
  myLib,
  ...
}:
{
  options.liyua.theme.arasaka.enable = lib.mkEnableOption "Arasaka Theme (optimized for rocinante)";
  config = lib.mkIf config.liyua.theme.arasaka.enable (
    let
      wall = myLib.relativeToRoot "assets/wallpaper/arasaka.jpg" |> toString;
    in
    (lib.mkForce {
      liyua = {
        programs.nvim.base16 = config.stylix.base16Scheme;
        desktop.wallpaper = {
          enable = true;
          type = "path";
          path.eDP-1 = builtins.path {
            path = wall;
            name = "arasaka-wallpaper";
          };
        };
      };
      stylix = {
        # base16-bright
        # black-metal-venom
        # circus
        # classic dark
        # horizon dark
        # ir black
        # outrun dark (tunen)
        # synth midnight dark

        base16Scheme = {
          base00 = "#161616"; # BG
          base01 = "#1d1d1d"; # Light BG
          base02 = "#6D1139"; # Highlight BG
          base03 = "#282828"; # Comments / Invisible Text
          base04 = "#636363"; # Dark FG
          base05 = "#aeaeae"; # FG
          base06 = "#cecece"; # Light FG
          base07 = "#484848"; # Light BG
          base08 = "#ae1173"; # Variables
          base09 = "#9c0064"; # Ints, Bools, Consts
          base0A = "#ba0134"; # Classes
          base0B = "#880055"; # Strings, Inheritance
          base0C = "#de3950"; # Regex, Escape chars
          base0D = "#a80026"; # Functions
          base0E = "#cc2442"; # Keywords
          base0F = "#636363"; # Deprecated, brackets
        };
        image = wall;
        polarity = "dark";
        cursor = {
          package = pkgs.bibata-cursors;
          name = "Bibata-Modern-Ice";
          size = 16;
        };
        iconTheme = {
          enable = true;
          package = pkgs.catppuccin-papirus-folders.override {
            flavor = "mocha";
            accent = "red";
          };
          dark = "Papirus-Dark";
          light = "Papirus-Light";
        };
        fonts = {
          monospace = {
            package = pkgs.nerd-fonts.jetbrains-mono;
            name = "JetBrainsMono Nerd Font Mono";
          };
          serif = config.stylix.fonts.monospace;
          sansSerif = config.stylix.fonts.monospace;
          emoji = config.stylix.fonts.monospace;
          # emoji = {
          #   package = pkgs.noto-fonts-emoji;
          #   name = "Noto Color Emoji";
          # };
        };
      };
    })
  );
}
