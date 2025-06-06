{
  config,
  lib,
  pkgs,
  ags,
  ...
}:
{
  options.liyua.desktop.bar.enable = lib.mkEnableOption "Enables the top bar in hyprland";

  config = lib.mkIf config.liyua.desktop.bar.enable {
    programs.ags = {
      enable = true;
      configDir = ./.;
      extraPackages = with ags.packages.${pkgs.system}; [
        hyprland
        mpris
        wireplumber
        network
        bluetooth
        battery
        notifd
        pkgs.hyprpicker
        pkgs.wl-clipboard
      ];
      systemd = {
        enable = true;
        gtk4 = true;
      };
    };
    home.file.".cache/ags/colors.scss".text =
      lib.strings.concatMapStrings
        (x: ''
          ''$${x}: ${config.lib.stylix.colors.withHashtag.${x}};
        '')
        (
          map (x: "base0${x}") (
            (map (x: toString x) (lib.range 0 9))
            ++ [
              "A"
              "B"
              "C"
              "D"
              "E"
              "F"
            ]
          )
        );
  };
}
