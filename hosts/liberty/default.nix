{ nixos-hardware, ... }:
{
  imports = [
    nixos-hardware.nixosModules.minisforum-v3
    ./hardware-configuration.nix
    ./modules/disko.nix
  ];

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
    batmon.enable = true;
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
    powerManagement.enable = true;
    btop.gpuType = "amd";
    yubikey.enable = true;
  };

  networking.hostName = "liberty";
  console.keyMap = "de";
}
