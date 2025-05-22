{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.ags.homeManagerModules.default];

  programs.ags = {
    enable = true;
    configDir = ./.;
    extraPackages = [
      inputs.ags.packages.${pkgs.system}.battery
    ];
  };
  # systemd.user.services.ags = {
  #   Unit.Description = "Starts AGS after a GUI is loaded.";
  #   Install.WantedBy = ["graphical-session.target"];
  #   Service.ExecStart = "${inputs.ags.packages.${pkgs.system}.default}/bin/ags run --gtk4";
  # };
  # home.file.".cache/ags/colors.scss".text =
  #   "* {\n"
  #   + lib.strings.concatMapStrings
  #   (x: "\$${x}: ${config.lib.stylix.colors.withHashtag.${x}};\n")
  #   (map
  #     (x: "base0${x}")
  #     ((
  #         map
  #         (x: toString x)
  #         (lib.range 0 9)
  #       )
  #       ++ ["A" "B" "C" "D" "E" "F"]))
  #   + "}";
}
