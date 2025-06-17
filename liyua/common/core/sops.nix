{ config, ... }:
{
  sops = {
    defaultSopsFile = ../../../secrets.yaml;
    validateSopsFiles = true;
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
  };
}
