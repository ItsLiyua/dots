{
  config,
  lib,
  pkgs,
  ags,
  ...
}: {
  imports = [ags.homeManagerModules.default];

  programs.ags = {
    enable = true;
    configDir = ./.;
    extraPackages = with pkgs; [
      dart-sass
      gtk-layer-shell
      ags.packages.${pkgs.system}.battery
    ];
    systemd.enable = true;
  };
  home.file.".cache/ags/colors.scss".text =
    # "* {\n" +
    lib.strings.concatMapStrings
    (x: "\$${x}: ${config.lib.stylix.colors.withHashtag.${x}};\n")
    (map
      (x: "base0${x}")
      ((
          map
          (x: toString x)
          (lib.range 0 9)
        )
        ++ ["A" "B" "C" "D" "E" "F"]));
  # + "}";
}
