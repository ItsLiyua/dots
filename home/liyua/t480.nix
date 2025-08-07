{ config, pkgs, ... }:
{
  liyua = {
    apps = {
      discord.enable = true;
      firefox.enable = true;
      foot.enable = true;
      thunar.enable = true;
      steam.enable = true;
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
      nvim.enable = true;
      tokei.enable = true;
    };
    clipboard.enable = true;
    xdg.enable = true;
  };

  sops.secrets = {
    # Used for SSH and GPG
    "liyua/yubikey/nfc/ssh/private".path = "${config.home.homeDirectory}/.ssh/id_yubikey";
    "liyua/yubikey/nfc/ssh/public".path = "${config.home.homeDirectory}/.ssh/id_yubikey.pub";
  };

  programs.btop.settings.selected_battery = "BAT1"; # Use external battery for t480
  home.packages = with pkgs; [
    libreoffice
    gimp
  ];
}
