{ config, pkgs, ... }:
{
  liyua = {
    unfree = {
      enable = true;
      whitelist = [
        "steam"
        "steam-unwrapped"
        "discord"
      ];
    };
    apps = {
      discord.enable = true;
      firefox.enable = true;
      foot.enable = true;
      nautilus.enable = true;
      prismlauncher.enable = true;
      steam.enable = true;
      zathura.enable = true;
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
      wm.niri.enable = true;
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
    clipboard.enable = true;
    xdg.enable = true;

    programs = {
      btop = {
        enable = true;
        whitelistedDrives = [
          "/"
          "/boot"
          "/home"
          "/mnt/nfs"
        ];
      };
      cava.enable = true;
      tokei.enable = true;
      nvim.enable = true;
    };
  };

  sops.secrets."liyua/yubikey/nano/ssh".path = "${config.home.homeDirectory}/.ssh/id_yubikey";

  home.packages = [ pkgs.gamescope ];
}
