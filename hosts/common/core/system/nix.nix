{ config, ... }:
{
  sops.secrets."nix/github" = {
    mode = "0440";
    group = config.users.groups.keys.name;
  };
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operators"
      ];
      warn-dirty = false;
    };
    extraOptions = ''
      !include ${config.sops.secrets."nix/github".path}
    '';
  };
  system.stateVersion = "25.11";
}
