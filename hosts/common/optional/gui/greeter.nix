{
  config,
  lib,
  pkgs,
  ...
}:
{
  config.services.greetd =
    with config.liyua.ui.greeter;
    lib.mkIf enable {
      enable = true;
      settings = {
        default_session = {
          command = ''${pkgs.greetd.tuigreet}/bin/tuigreet -tr --asterisks --asterisks-char "*" --cmd "${launchCommand}"'';
          user = "greeter";
        };
      };
    };
}
