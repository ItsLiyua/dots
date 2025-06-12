{
  imports = [
    ./hardware-configuration.nix
    ./modules/disko.nix
    ./modules/bluetooth.nix
    ./modules/upower.nix
  ];

  config = {
    liyua = {
      ui = {
        dconf.enable = true;
        greeter = {
          enable = true;
          launchCommand = "Hyprland";
        };
        wayland.enable = true;
      };
      audio.enable = true;
      graphics.enable = true;
      bootloader = {
        enable = true;
        mode = "grub";
        memtest86.enable = true;
      };
      logind = {
        enable = true;
        powerKeyMode = "suspend";
      };
      swapescape.enable = true;
    };

    networking.hostName = "liberty";
    console.keyMap = "de";

    system.stateVersion = "24.11"; # DO NOT CHANGE UNDER ANY CIRCUMSTANCES!
  };
}
