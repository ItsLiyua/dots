{
  config,
  lib,
  pkgs,
  ags,
  ...
}:
{
  config = lib.mkIf config.liyua.desktop.bar.enable {
    home.packages = [ ags.inputs.astal.packages.${pkgs.system}.default ];
    programs.ags = {
      enable = true;
      configDir = ./.;
      extraPackages = with ags.packages.${pkgs.system}; [
        # hyprland
        # mpris
        # wireplumber
        # network
        # bluetooth
        # battery
        # notifd
      ];
      systemd.enable = true;
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
