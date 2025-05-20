{ config, lib, pkgs, ... }: {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        grace = 60;
        hide_cursor = true;
      };
      background.blur_passes = 2;
      input-field = {
        size = "250, 60";
        outline_thickness = 2;
        dots_size = 0.2;
        dots_center = true;
        fade_on_empty = false;
        placeholder_text = "<i>Enter Password</i>";
        hide_input = false;
        position = "0, -225";
      };
      label = [
        { # Time
          text = "cmd[update:1000] echo \"<span>$(date +%H:%M)</span>\"";
          color = "rgba(${config.lib.stylix.colors.base05}b3)";
          font_size = 130;
          position = "0, 240";
        }
        { # Date
          text = "cmd[update:1000] echo $(date +\"%A, %d %B\")";
          color = "rgba(${config.lib.stylix.colors.base05}b3)";
          font_size = 30;
          position = "0, 105";
        }
        { # User
          text = "Hi, $DESC";
          color = "rgba(${config.lib.stylix.colors.base05}b3)";
          font_size = 25;
          position = "0, -130";
        }
      ];
      image = {
        path = "~/.config/home-manager/assets/pfp.png";
        border_size = 0;
        size = 120;
        rounding = -1;
        rotate = 0;
        reload_time = -1;
        position = "0, -20";
      };
    };
  };
}

