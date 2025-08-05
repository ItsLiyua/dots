{ config, lib, ... }:
{
  sops = {
    defaultSymlinkPath = "${config.xdg.configHome}/sops-nix/secrets";
    # defaultSopsFile = lib.liyua.relativeToRoot "./secrets/liyua.yaml";
    defaultSopsFile = ../../../../secrets/liyua.yaml;
    validateSopsFiles = true;
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
  };
}
