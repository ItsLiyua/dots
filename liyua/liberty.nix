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
        eDP-1 = {
          width = 2560;
          height = 1600;
          refreshRate = 60;
          scale = 1.6;
        };
      };
      layout = "de";
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
        suspend = true;
      };
      lockscreen.enable = true;
      screenshot.enable = true;
      theming.enable = true;
    };
    cli = {
      cava.enable = true;
      btop.gpudriver = "rocm";
      nvim = {
        lsp = true;
        sharedClipboard = true;
        theme = true;
      };
    };
    clipboard.enable = true;
    xdg.enable = true;
    steam.enable = true;
    remoteAccess.enable = true;
  };
}
