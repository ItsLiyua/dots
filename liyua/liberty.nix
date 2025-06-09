{
  config.liyua = {
    apps = {
      discord.enable = true;
      firefox.enable = true;
      foot.enable = true;
      nautilus.enable = true;
      prismlauncher.enable = true;
    };
    desktop = {
      displays.eDP-1 = {
        width = 2560;
        height = 1660;
        scale = 1.6;
      };
      layout = "de";
      wm.hyprland = {
        enable = true;
        xwayland.enable = true;
      };
      wallpaper = {
        enable = true;
        type = "nix";
      };
      idle = {
        enable = true;
        suspend = true;
      };
      lockscreen.enable = true;
    };
  };
}
