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
    extraPackages = [ags.packages.${pkgs.system}.battery];
    systemd = {
      enable = true;
      gtk4 = true;
    };
  };
  home.file.".cache/ags/colors.scss".text =
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
}
