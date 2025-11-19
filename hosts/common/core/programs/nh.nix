{ config, ... }:
{
  environment.sessionVariables.NH_FLAKE = config.programs.nh.flake;
  programs.nh = {
    enable = true;
    flake = "/etc/nixos"; # TODO: Find a decent way to point this at the user dir
    clean = {
      enable = true;
      extraArgs = "--keep-since 4d --keep 5";
    };
  };
}
