{ config, inputs, ... }:
{
  imports = with inputs.nixos-raspberrypi.nixosModules; [
    raspberry-pi-5.base
    raspberry-pi-5.bluetooth
    ./disko.nix
  ];
  config = {
    liyua = {
      audio.enable = false;
      bootloader.enable = false;
      extras.dconf.enable = false;
      fonts.enable = false;
      gaming.enable = false;
      greeter.enable = false;
      libinput.enable = false;
      logind.enable = false;
      waylandNativeOzone.enable = false;
    };
    networking.hostName = "rpi5-1";
    nix.settings = {

      substituters = [ "https://nixos-raspberrypi.cachix.org" ];
      trusted-public-keys = [
        "nixos-raspberrypi.cachix.org-1:4iMO9LXa8BqhU+Rpg6LQKiGa2lsNh/j2oiYLNOQ5sPI="
      ];
    };
    system.stateVersion = "25.05";
  };
}
