{ config, lib, pkgs, inputs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/disko.nix
    ];

  networking.hostName = "liberty";
  console.keyMap = "de";

  system.stateVersion = "24.11"; # DO NOT CHANGE UNDER ANY CIRCUMSTANCES!
}

