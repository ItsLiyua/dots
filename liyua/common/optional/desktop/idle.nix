{
  config,
  lib,
  pkgs,
  ...
}:
{
  config.services.hypridle = lib.mkIf config.liyua.desktop.idle.enable {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };
      listener =
        [
          {
            timeout = 120; # 2 minutes
            on-timeout = "${pkgs.brightnessctl}/bin/brightnessctl -s set 0";
            on-resume = "${pkgs.brightnessctl}/bin/brightnessctl -r";
          }
          {
            timeout = 900; # 15 minutes
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on && ${pkgs.brightnessctl}/bin/brightnessctl -r";
          }
        ]
        ++ (
          if
            config.liyua.desktop.lockscreen.enable # Add Hyprlock to hypridle if hyprlock is enabled
          then
            [
              {
                timeout = 300; # 5 minutes
                on-timeout = "pidof hyprlock || hyprlock";
              }
            ]
          else
            [ ]
        )
        ++ (
          if config.liyua.desktop.idle.suspend then
            [
              {
                timeout = 1800; # 30 minutes
                on-timeout = "systemctl suspend";
              }
            ]
          else
            [ ]
        );
    };
  };
}
