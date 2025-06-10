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
      displays = {
        DP-3 = {
          width = 3440;
          height = 1440;
          refreshRate = 144;
        };
        HDMI-A-1 = {
          width = 1920;
          height = 1080;
          refreshRate = 60;
          pos = {
            x = -1920;
            y = 0;
          };
        };
      };
      layout = "us";
      bar.enable = true;
      wm.hyprland = {
        enable = true;
        xwayland.enable = true;
      };
      wallpaper = {
        enable = true;
        type = "nix";
        nix.theme = "rainbow";
      };
      idle = {
        enable = true;
        suspend = false;
      };
      lockscreen.enable = true;
      screenshot.enable = true;
      theming.enable = true;
    };
    cli = {
      cava.enable = true;
    };
    clipboard.enable = true;
    nvim.lsp.enable = true;
    xdg.enable = true;
    steam.enable = true;
  };
}
