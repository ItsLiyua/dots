{ pkgs, ... }:
{
  liyua = {
    apps = {
      discord.enable = true;
      firefox.enable = true;
      foot.enable = true;
      thunar.enable = true;
      # steam.enable = true;
    };
    desktop = {
      displays.eDP-1 = {
        width = 1920;
        height = 1080;
        refreshRate = 60.0;
      };
      layout = "eu";
      bar.enable = true;
      wm = {
        hyprland = {
          # enable = true;
          xwayland.enable = true;
        };
        niri.enable = true;
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
      screenshot.enable = true;
      theming.enable = true;
    };
    cli = {
      cava.enable = true;
      nvim = {
        lsp = true;
        sharedClipboard = true;
        theme = true;
        extraLanguages = true;
      };
      tokei.enable = true;
    };
    clipboard.enable = true;
    xdg.enable = true;
    steam.enable = false;
    remoteAccess.enable = true;
  };

  programs.btop.settings.selected_battery = "BAT1"; # Use external battery for t480
  home.packages = [ pkgs.libreoffice ];
}
