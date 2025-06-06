{ config, lib, ... }:
{
  options.liyua.desktop.hyprland.rules.enable = lib.mkEnableOption "Layer- and WindowRules";
  config = {
    liyua.desktop.hyprland.rules.enable = config.liyua.desktop.hyprland.enable;
    wayland.windowManager.hyprland.settings = lib.mkIf config.liyua.desktop.hyprland.rules.enable {
      # TODO: Move all these rules to their specific app definitions.
      windowrule = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];
      layerrule = [
        "noanim, selection"
        "noanim, my-bar"
      ];
    };
  };
}
