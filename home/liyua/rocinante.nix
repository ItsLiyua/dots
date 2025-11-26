{ pkgs, ... }:
{
  liyua = {
    unfree = {
      enable = true;
      whitelist = [
        "steam"
        "steam-unwrapped"
        "discord"
        "makemkv"
      ];
    };
    apps = {
      firefox.enable = true;
      nautilus.enable = true;
      zathura.enable = true;
      discord.enable = true;
      prismlauncher.enable = true;
      # makemkv.enable = true;
      # steam.enable = true;
      # thunderbird.enable = true;
    };
    desktop = {
      displays.eDP-1 = {
        width = 1920;
        height = 1080;
        refreshRate = 60.0;
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
        suspend = true;
      };
      lockscreen.enable = true;
      screenshot.enable = true;
      theming.enable = true;
      ags.enable = false;
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
    # theme.arasaka.enable = true;
  };

  home.packages = [ pkgs.mattermost-desktop ];
}
