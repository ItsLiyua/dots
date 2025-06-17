{ nixos-hardware, ... }:
{
  imports = [
    nixos-hardware.nixosModules.lenovo-thinkpad-t480
    ./hardware-configuration.nix
    ./modules/disko.nix
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
        mode = "systemd-boot";
        memtest86.enable = true;
      };
      logind = {
        enable = true;
        powerKeyMode = "suspend";
      };
      swapescape.enable = true;
      # firmwareUpdater.enable = true;
    };

    networking.hostName = "t480";
    console.keyMap = "de";

    system.stateVersion = "24.11"; # DO NOT CHANGE UNDER ANY CIRCUMSTANCES!
  };
}
