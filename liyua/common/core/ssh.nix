{ config, lib, ... }:
{
  config.programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
      };
      "liberty" = {
        hostname = "liberty";
        user = "liyua";
        identityFile = "~/.ssh/id_ed25519";
      };
      "resolute" = {
        hostname = "resolute";
        user = "liyua";
        identityFile = "~/.ssh/id_ed25519";
      };
      "rpi5-1" = {
        hostname = "rpi5";
        user = "liyua";
        identityFile = "~/.ssh/id_ed25519";
      };
      "rpi5-2" = {
        hostname = "rpi5";
        user = "liyua";
        identityFile = "~/.ssh/id_ed25519";
      };
    };
  };
}
