{ config, ... }:
{
  sops = {
    defaultSopsFile = ../../../secrets/liyua.yaml;
    validateSopsFiles = true;
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
  };
}
