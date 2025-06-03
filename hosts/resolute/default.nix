{lib, ...}: {
  config = {
    liyua.desktop = {
      screenRotation.enable = false;
      hyprland.hyprsplit.enable = true;
    };
    wayland.windowManager.hyprland.settings = {
      monitor = [
        "HDMI-A-1,1920x1080@60,-1920x0,1"
        "DP-3,3440x1440@144,0x0,1"
      ];
      input.kb_layout = lib.mkForce "eu";
    };
  };
}
