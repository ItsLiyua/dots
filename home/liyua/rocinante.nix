{ pkgs, ... }:
{
  liyua = {
    apps = {
      firefox.enable = true;
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
      wm.niri.enable = true;
      idle = {
        enable = true;
        suspend = true;
      };
      lockscreen.enable = true;
      screenshot.enable = true;
      theming.enable = true;
      ags.enable = true;
    };
    clipboard.enable = true;
    xdg.enable = true;

    programs = {
      btop = {
        enable = true;
        whitelistedDrives = [
          "/"
          "/boot"
          "/mnt/nfs/shared"
        ];
      };
      nvim.enable = true;
      tokei.enable = true;
      cava.enable = true;
    };
    yubikey = {
      enable = true;
      usedKey = "nfc";
    };
    theme.arasaka.enable = true;
  };

  programs.btop.settings.selected_battery = "BAT1"; # Use external battery for t480
  home.packages = with pkgs; [ rpi-imager ];
}
