{ config, myLib, ... }:
{
  sops = {
    defaultSymlinkPath = "${config.xdg.configHome}/sops-nix/secrets";
    defaultSopsFile = myLib.relativeToRoot "secrets/liyua.yaml";
    validateSopsFiles = true;
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
  };
}
