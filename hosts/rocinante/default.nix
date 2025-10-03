{ nixos-hardware, ... }:
{
  imports = [
    nixos-hardware.nixosModules.lenovo-thinkpad-t480
    ./hardware-configuration.nix
    ./modules/disko.nix
  ];

  liyua = {
    unfree = {
      enable = true;
      whitelist = [
        "steam"
        "steam-unwrapped"
      ];
    };
    ui = {
      gaming.gamepadSupport = true;
      greeter = {
        enable = true;
        launchCommand = "niri-session";
      };
      wayland.enable = true;
    };
    audio.enable = true;
    graphics.enable = true;
    batmon.enable = true;
    bootloader = {
      enable = true;
      mode = "systemd-boot";
      timeout = 0;
      logLevel = 0;
      memtest86.enable = true;
      plymouth.enable = true;
    };
    logind = {
      enable = true;
      powerKeyMode = "suspend";
    };
    swapescape.enable = true;
    # firmwareUpdater.enable = true;
    bluetooth.enable = true;
    upower.enable = true;
    network = {
      wireless.enable = true;
      hostnameAdvertisement.enable = true;
      wireguard = {
        enable = true;
        self = "rocinante"; # See modules/network/wireguard.nix
      };
    };
    powerManagement.enable = true;
    btop.gpuType = "intel";
    localsend.enable = true;
    yubikey.enable = true;
    nfs = {
      enable = true;
      drives.shared.enable = true;
    };
    eduroam.enable = true;
  };

  services.arasaka-greeter = {
    enable = false;
    settings = {
      user = "greeter";
      defaultProperties = {
        username = "liyua";
        command = "niri-session";
      };
    };
  };

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  networking.hostName = "rocinante";
  console.keyMap = "us";
}
