{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.liyua.ui.greeter = {
    enable = lib.mkEnableOption "Display Manager";
    arasaka = lib.mkEnableOption "Arasaka Theme";
    launchCommand = lib.mkOption {
      type = lib.types.str;
      description = "Which command to run on login";
    };
    text = lib.mkOption {
      type = with lib.types; nullOr str;
      description = "The extra text on the login screen";
      default = null;
    };
  };
  config =
    let
      cfg = config.liyua.ui.greeter;
    in
    lib.mkIf cfg.enable {
      programs.dconf.enable = true; # Required by some desktop utils in the home manager config.
      services.greetd = {
        enable = true;
        settings = {
          default_session = {
            command = ''${pkgs.tuigreet}/bin/tuigreet -tr --asterisks --asterisks-char "*" ${
              if cfg.text != null then ''-g "${cfg.text}"'' else ""
            } --user-menu --window-padding 2 --theme "text=white;container=black;border=red;greet=white;prompt=red;input=white;action=white" --cmd "${cfg.launchCommand}"'';
            # command = ''${arasaka-greeter.packages.${pkgs.system}.default}/bin/launch-arasaka-greeter'';
            user = "greeter";
          };
        };
      };
    };
}
