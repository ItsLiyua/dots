{ config, ... }:
{
  liyua = {
    unfree = {
      enable = true;
      whitelist = [ "discord" ];
    };
    apps = {
      discord.enable = true;
      firefox.enable = true;
      foot.enable = true;
      nautilus.enable = true;
      zathura.enable = true;
    };
    desktop = {
      displays.eDP-1 = {
        width = 2560;
        height = 1600;
        refreshRate = 60.0;
        scale = 1.6;
      };
      layout = "de";
      wm.niri.enable = true;
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
    clipboard.enable = true;
    xdg.enable = true;
    programs = {
      btop = {
        enable = true;
        whitelistedDrives = [
          "/"
          "/boot"
        ];
      };
      nvim.enable = true;
    };
  };

  sops.secrets."liyua/yubikey/nfc-c/ssh".path = "${config.home.homeDirectory}/.ssh/id_yubikey";
}
