{
  liyua = {
    apps = {
      discord.enable = true;
      firefox.enable = true;
      foot.enable = true;
      thunar.enable = true;
      prismlauncher.enable = true;
      steam.enable = true;
    };
    desktop = {
      displays = {
        DP-3 = {
          width = 3440;
          height = 1440;
          refreshRate = 144.0;
        };
        HDMI-A-1 = {
          width = 1920;
          height = 1080;
          refreshRate = 60.0;
          pos = {
            x = -1920;
            y = 0;
          };
        };
      };
      layout = "eu";
      bar.enable = true;
      wm.niri.enable = true;
      # wm.hyprland = {
      #   enable = true;
      #   xwayland.enable = true;
      # };
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
      tokei.enable = true;
      nvim = {
        lsp = true;
        sharedClipboard = true;
        theme = true;
        extraLanguages = true;
      };
    };
    clipboard.enable = true;
    xdg.enable = true;
    remoteAccess.enable = true;
  };
}
