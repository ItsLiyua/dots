{
  environment.sessionVariables.NH_OS_FLAKE = "/etc/nixos";
  programs.nh = {
    enable = true;
    flake = "/etc/nixos";
    clean = {
      enable = false;
      extraArgs = "--keep-since 4d --keep 5";
    };
  };
}
