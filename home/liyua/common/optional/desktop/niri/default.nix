{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.liyua.desktop.wm.niri.enable {
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
    settings = {
      prefer-no-csd = true;
      spawn-at-startup = [
        {
          command = [
            "systemctl"
            "--user"
            "import-environment"
            "WAYLAND_DISPLAY"
            "XDG_CURRENT_DESKTOP"
            "XDG_RUNTIME_DIR"
          ];
        }
      ];
      binds = with config.lib.niri.actions; {
        "Mod+grave".action = toggle-overview;
        "Mod+Q".action = close-window;
        "Mod+M".action = quit { skip-confirmation = false; };

        "Mod+T".action = spawn "kitty";
        "Mod+F".action = spawn "firefox";
        "Mod+E".action = spawn "nautilus";
        "Mod+A".action = spawn [
          "${pkgs.wofi}/bin/wofi"
          "--show"
          "drun"
        ];

        "Mod+V".action = toggle-window-floating;
        "Mod+B".action = fullscreen-window;

        "Mod+H".action = focus-column-left;
        "Mod+J".action = focus-window-down;
        "Mod+K".action = focus-window-up;
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

        "Mod+Shift+1".action.move-column-to-workspace = [
          1
          { focus = false; }
        ];
        "Mod+Shift+2".action.move-column-to-workspace = [
          2
          { focus = false; }
        ];
        "Mod+Shift+3".action.move-column-to-workspace = 3;
        "Mod+Shift+4".action.move-column-to-workspace = 4;
        "Mod+Shift+5".action.move-column-to-workspace = 5;
        "Mod+Shift+6".action.move-column-to-workspace = 6;
        "Mod+Shift+7".action.move-column-to-workspace = 7;
        "Mod+Shift+8".action.move-column-to-workspace = 8;
        "Mod+Shift+9".action.move-column-to-workspace = 9;
        "Mod+Shift+0".action.move-column-to-workspace = 10;

        "Print".action.screenshot = [ ];
        "Mod+P".action.screenshot = [ ];
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
        "Mod+Comma".action.set-column-width = "+5%";
        "Mod+Shift+Comma".action.set-column-width = "-5%";
        "Mod+Period".action.set-window-height = "+5%";
        "Mod+Shift+Period".action.set-window-height = "-5%";
        "Mod+W".action = switch-preset-column-width;
        "Mod+C".action = consume-or-expel-window-left;
        "Mod+Shift+C".action = consume-or-expel-window-right;

        "Mod+Tab".action = focus-monitor-next;
        "Mod+Shift+Tab".action = move-window-to-monitor-next;
      };
      input = {
        keyboard.xkb.layout = config.liyua.desktop.layout;
        touchpad.natural-scroll = false;
        mouse.accel-profile = "flat";
        focus-follows-mouse.enable = true;
      };
      outputs =
        config.liyua.desktop.displays
        |> builtins.attrNames
        |> map (name: {
          inherit name;
          value = config.liyua.desktop.displays.${name};
        })
        |> map (pair: {
          inherit (pair) name;
          value = {
            mode = {
              inherit (pair.value) width height;
              refresh = pair.value.refreshRate;
            };
            inherit (pair.value) scale;
            focus-at-startup = pair.value.focus;
            position = pair.value.pos;
          };
        })
        |> builtins.listToAttrs;
      layout = {
        default-column-width.proportion = 0.5;
        preset-column-widths = [
          { proportion = 0.5; }
          { proportion = 1.0; }
        ];
      };
      screenshot-path = "~/Pictures/screenshots/%Y%m%d-%H%M%S.png";
      overview.backdrop-color = config.lib.stylix.colors.withHashtag.base01;
      hotkey-overlay.skip-at-startup = true;
      xwayland-satellite = {
        enable = true;
        path = "${pkgs.xwayland-satellite-unstable}/bin/xwayland-satellite";
      };
      layout = {
        focus-ring.enable = false;
        border = {
          enable = true;
          width = 2;
          active.gradient = {
            from = config.lib.stylix.colors.withHashtag.base0B;
            to = config.lib.stylix.colors.withHashtag.base0D;
            angle = 45;
            relative-to = "workspace-view";
          };
          inactive.color = config.lib.stylix.colors.withHashtag.base03;
        };
      };
      workspaces =
        {
          display = (builtins.attrNames config.liyua.desktop.displays);
          index = (lib.range 0 9 |> map (n: toString n));
        }
        |> lib.mapCartesianProduct (
          { display, index }:
          {
            name = "${display}-${index}";
            value.open-on-output = display;
          }
        )
        |> builtins.listToAttrs;
    };
  };
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
}
