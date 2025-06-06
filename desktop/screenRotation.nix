{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.liyua.desktop.screenRotation.enable =
    lib.mkEnableOption "Adds a button to rotate the screen.";
  config = {
    home.file = lib.mkIf config.liyua.desktop.screenRotation.enable {
      ".local/bin/scripts/rotateScreen.sh".text = ''
        #!${pkgs.bash}/bin/bash
        hyprctl keyword monitor ${builtins.elemAt config.wayland.windowManager.hyprland.settings.monitor 0}, transform, 3
      '';
    };
  };
}
