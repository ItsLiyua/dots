{ config, pkgs, ... }:
{
  liyua = {
    unfree.enable = false;
    apps = {
      firefox.enable = true;
      foot.enable = true;
      nautilus.enable = true;
      zathura.enable = true;
    };
    desktop = {
      displays.eDP-1 = {
        width = 1920;
        height = 1080;
        refreshRate = 60.0;
      };
      layout = "eu";
      bar.enable = true;
      wm.niri.enable = true;
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
      ags.enable = true;
    };
    cli = {
      cava.enable = true;
      nvim.enable = true;
      tokei.enable = true;
    };
    clipboard.enable = true;
    xdg.enable = true;
  };

  sops.secrets."liyua/yubikey/nfc/ssh".path = "${config.home.homeDirectory}/.ssh/id_yubikey";

  programs.btop.settings.selected_battery = "BAT1"; # Use external battery for t480
  home.packages = with pkgs; [
    libreoffice
    gimp
  ];
}
