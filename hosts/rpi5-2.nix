{
  config,
  lib,
  pkgs,
  nixos-raspberrypi,
  ...
}:
{
  imports = with nixos-raspberrypi.nixosModules; [
    raspberry-pi-5.base
    raspberry-pi-5.display-vc4
    raspberry-pi-5.bluetooth
    ./pi-disko.nix
  ];
  config = {
    liyua.swapescape.enable = true;

    networking.hostName = "rpi5-2";
    nix.settings = {
      substituters = [ "https://nixos-raspberrypi.cachix.org" ];
      trusted-public-keys = [
        "nixos-raspberrypi.cachix.org-1:4iMO9LXa8BqhU+Rpg6LQKiGa2lsNh/j2oiYLNOQ5sPI="
      ];
    };
    system.stateVersion = "25.05";

    # system.nixos.tags =
    #   let
    #     cfg = config.boot.loader.raspberryPi;
    #   in
    #   [
    #     "raspberry-pi-${cfg.variant}"
    #     cfg.bootloader
    #     config.boot.kernelPackages.kernel.version
    #   ];
  };
}
