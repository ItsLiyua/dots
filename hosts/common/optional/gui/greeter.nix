{
  config,
  lib,
  pkgs,
  ...
}:
with config.liyua.ui.greeter;
lib.mkIf enable {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = ''${pkgs.greetd.tuigreet}/bin/tuigreet -tr --asterisks --asterisks-char "*" ${
          if text != null then ''-g "${text}"'' else ""
        } --user-menu --window-padding 2 --theme "text=white;container=black;border=red;greet=white;prompt=red;input=white;action=white" --cmd "${launchCommand}"'';
        # command = ''${arasaka-greeter.packages.${pkgs.system}.default}/bin/launch-arasaka-greeter'';
        user = "greeter";
      };
    };
  };
}
