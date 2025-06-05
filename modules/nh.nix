{ config, lib, ... }: {
  options.liyua.nh.enable = lib.mkEnableOption "Nix Helper CLI";
  config = lib.mkIf config.liyua.nh.enable {
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
