{ config, ... }:
{
  sops = {
    defaultSopsFile = ../../../secrets.yaml;
    validateSopsFiles = false;
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
  };
}
