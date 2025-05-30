{
  config,
  lib,
  ...
}: {
  options.liyua.idle.enable = lib.mkEnableOption "Enable the idle handler";
  config = {
    services.hypridle = lib.mkIf config.liyua.idle.enable {
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
              on-timeout = "brightnessctl -s set 0";
              on-resume = "brightnessctl -r";
            }
            {
              timeout = 900; # 15 minutes
              on-timeout = "hyprctl dispatch dpms off";
              on-resume = "hyprctl dispatch dpms on && brightnessctl -r";
            }
            {
              timeout = 1800; # 30 minutes
              on-timeout = "systemctl suspend";
            }
          ]
          ++ (
            if config.liyua.lockscreen.enable # Add Hyprlock to hypridle if hyprlock is enabled
            then [
              {
                timeout = 300; # 5 minutes
                on-timeout = "pidof hyprlock || hyprlock";
              }
            ]
            else []
          );
      };
    };
  };
}
