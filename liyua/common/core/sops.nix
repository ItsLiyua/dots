{ config, ... }:
{
  sops = {
    defaultSopsFile = ../../../secrets.yaml;
    validateSopsFiles = false;
    age.keyFile = "/home/${config.home.username}/.config/sops/age/keys.txt";
  };
}
