{
  config,
  lib,
  pkgs,
  ...
}:
{
  wayland.windowManager.hyprland.settings = lib.mkIf config.liyua.desktop.wm.hyprland.enable {
    bind = [
      "$mod, Q, killactive"
      "$mod, M, exit"

      "$mod, T, exec, ${pkgs.foot}/bin/foot"
      "$mod, F, exec, ${pkgs.firefox}/bin/firefox"
      "$mod, A, exec, ${pkgs.wofi}/bin/wofi --show drun"

      "$mod, V, togglefloating"
      "$mod, B, fullscreen"

      "$mod, H, movefocus, l"
      "$mod, J, movefocus, d"
      "$mod, K, movefocus, u"
      "$mod, L, movefocus, r"

      "$mod SHIFT, H, movewindow, l"
      "$mod SHIFT, J, movewindow, d"
      "$mod SHIFT, K, movewindow, u"
      "$mod SHIFT, L, movewindow, r"
    ];
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
    bindel = [
      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl -e4 -n2 set 5%+"
      ",XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl -e4 -n2 set 5%-"
    ];
    bindl = [
      ",XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next"
      ",XF86AudioPause, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
      ",XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
      ",XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous"
    ];
  };
}
