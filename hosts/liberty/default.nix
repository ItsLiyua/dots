{ nixos-hardware, ... }:
{
  imports = [
    nixos-hardware.nixosModules.minisforum-v3
    ./hardware-configuration.nix
    ./modules/disko.nix
  ];

  config = {
    liyua = {
      ui = {
        dconf.enable = true;
        greeter = {
          enable = true;
          launchCommand = "niri-session";
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
      bluetooth.enable = true;
      upower.enable = true;
      network = {
        wireless.enable = true;
        hostnameAdvertisement.enable = true;
        wireguard = {
          enable = true;
          self = "liberty"; # See modules/network/wireguard.nix
        };
      };
    };

    networking.hostName = "liberty";
    console.keyMap = "de";

    system.stateVersion = "24.11"; # DO NOT CHANGE UNDER ANY CIRCUMSTANCES!
  };
}
