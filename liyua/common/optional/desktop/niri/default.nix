{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.liyua.desktop.wm.niri.enable {
    programs.niri = {
      enable = true;
      settings = {
        prefer-no-csd = true;
        binds = with config.lib.niri.actions; {
          "Mod+Q".action = close-window;
          "Mod+M".action = quit { skip-confirmation = false; };

          "Mod+T".action = spawn "${pkgs.foot}/bin/foot";
          "Mod+F".action = spawn "firefox";
          "Mod+A".action = spawn [
            "${pkgs.wofi}/bin/wofi"
            "--show"
            "drun"
          ];

          "Mod+V".action = toggle-window-floating;
          "Mod+B".action = fullscreen-window;

          "Mod+H".action = focus-column-left;
          "Mod+J".action = focus-window-or-monitor-down;
          "Mod+K".action = focus-window-or-monitor-up;
          "Mod+L".action = focus-column-right;

          "Mod+Shift+H".action = move-column-left;
          "Mod+Shift+J".action = move-window-down;
          "Mod+Shift+K".action = move-window-up;
          "Mod+Shift+L".action = move-column-right;

          "Mod+1".action = focus-workspace 1;
          "Mod+2".action = focus-workspace 2;
          "Mod+3".action = focus-workspace 3;
          "Mod+4".action = focus-workspace 4;
          "Mod+5".action = focus-workspace 5;
          "Mod+6".action = focus-workspace 6;
          "Mod+7".action = focus-workspace 7;
          "Mod+8".action = focus-workspace 8;
          "Mod+9".action = focus-workspace 9;
          "Mod+0".action = focus-workspace 10;

          "Mod+Shift+1".action.move-column-to-workspace = 1;
          "Mod+Shift+2".action.move-column-to-workspace = 2;
          "Mod+Shift+3".action.move-column-to-workspace = 3;
          "Mod+Shift+4".action.move-column-to-workspace = 4;
          "Mod+Shift+5".action.move-column-to-workspace = 5;
          "Mod+Shift+6".action.move-column-to-workspace = 6;
          "Mod+Shift+7".action.move-column-to-workspace = 7;
          "Mod+Shift+8".action.move-column-to-workspace = 8;
          "Mod+Shift+9".action.move-column-to-workspace = 9;
          "Mod+Shift+0".action.move-column-to-workspace = 10;

          "Print".action = screenshot;
          "Mod+Space".action = toggle-overview;

          # XF86WakeUp.action = null;
          XF86AudioMute.action = spawn "wpctl" "set-mute" "@DEFAULT_SINK@" "toggle";
          XF86AudioLowerVolume.action = spawn "wpctl" "set-volume" "@DEFAULT_SINK@" "0.03-";
          XF86AudioRaiseVolume.action = spawn "wpctl" "set-volume" "@DEFAULT_SINK@" "0.03+";
          XF86MonBrightnessDown.action = spawn "${pkgs.brightnessctl}/bin/brightnessctl" "s" "2%-";
          XF86MonBrightnessUp.action = spawn "${pkgs.brightnessctl}/bin/brightnessctl" "s" "+2%";
          # XF86Display.action = null;
          # XF86WLAN.action = null;
          # XF86Tools.action = null;
          # XF86Bluetooth.action = null;
          # XF86Favorites.action = null;
        };
        input = {
          keyboard.xkb.layout = "de";
          touchpad.natural-scroll = false;
          mouse.accel-profile = "flat";
          focus-follows-mouse.enable = true;
        };
        outputs."eDP-1" = {
          scale = 1;
          mode = {
            height = 1920;
            width = 1080;
            refresh = 60.0;
          };
        };
        layout.default-column-width.proportion = 0.5;
        screenshot-path = "~/Pictures/screenshots/$(date +%Y%m%d-%H%M%S).png";
        overview.backdrop-color = config.lib.stylix.colors.withHashtag.base01;
        hotkey-overlay.skip-at-startup = true;
      };
    };
    stylix.targets.niri.enable = true;
  };
}
