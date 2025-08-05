{ nixos-hardware, ... }:
{
  imports = [
    nixos-hardware.nixosModules.lenovo-thinkpad-t480
    ./hardware-configuration.nix
    ./modules/disko.nix
  ];

  liyua = {
    ui = {
      dconf.enable = true;
      greeter = {
        enable = false;
        launchCommand = "niri-session";
        text = "Property of the Arasaka Corporation";
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
        self = "t480"; # See modules/network/wireguard.nix
      };
    };
    powerManagement.enable = true;
    btop.gpuType = "intel";
    localsend.enable = true;
    nfs.enable = true;
  };
  # services.greetd = {
  #   enable = true;
  #   settings = {
  #     default_session = {
  #       command = ''${arasaka-greeter.packages.x86_64-linux.default}/bin/launch-arasaka-greeter'';
  #       user = "greeter";
  #     };
  #   };
  # };

  services.arasaka-greeter = {
    enable = true;
    settings = {
      user = "greeter";
      defaultProperties = {
        username = "liyua";
        command = "niri-session";
      };
    };
  };

  networking.hostName = "t480";
  console.keyMap = "us";
}
