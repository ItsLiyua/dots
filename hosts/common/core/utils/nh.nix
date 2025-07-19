{
  environment.sessionVariables.NH_OS_FLAKE = "/etc/nixos";
  programs.nh = {
    enable = true;
    clean = {
      enable = false;
      extraArgs = "--keep-since 4d --keep 5";
    };
  };
}
