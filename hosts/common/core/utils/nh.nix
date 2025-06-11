{ config, lib, ... }:
{
  config = {
    environment.sessionVariables = {
      NH_OS_FLAKE = "/etc/nixos";
      NH_HOME_FLAKE = "$HOME/.config/home-manager";
    };
    programs.nh = {
      enable = true;
      clean.enable = false;
    };
  };
}
