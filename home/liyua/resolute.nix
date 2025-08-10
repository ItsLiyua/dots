{ config, pkgs, ... }:
{
  liyua = {
    apps = {
      discord.enable = true;
      firefox.enable = true;
      foot.enable = true;
      nautilus.enable = true;
      prismlauncher.enable = true;
      steam.enable = false;
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
      bar.enable = true;
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
    cli = {
      cava.enable = true;
      tokei.enable = true;
      nvim.enable = true;
    };
    clipboard.enable = true;
    xdg.enable = true;
  };

  sops.secrets = {
    # Used for SSH and GPG
    "liyua/yubikey/nano/ssh/private".path = "${config.home.homeDirectory}/.ssh/id_yubikey";
    "liyua/yubikey/nano/ssh/public".path = "${config.home.homeDirectory}/.ssh/id_yubikey.pub";
  };

  programs.git.extraConfig = {

  };

  home.packages = [ pkgs.gamescope ];
}
