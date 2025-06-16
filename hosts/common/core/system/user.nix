{ config, ... }:
{
  sops.secrets = {
    "liyua/password".neededForUsers = true;
    "root/password".neededForUsers = true;
  };
  users = {
    mutableUsers = false;
    users = {
      liyua = {
        description = "Liyua";
        isNormalUser = true;
        useDefaultShell = true;
        hashedPasswordFile = config.sops.secrets."liyua/password".path;
        extraGroups = [
          "wheel"
          "networkmanager"
          "audio"
          "video"
          "input"
          "power"
        ];
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHKZZyrwb0depJAXqeoN8+q8kquwgAHz3uRssneGDtp0 liyua"
        ];
      };
      root.hashedPasswordFile = config.sops.secrets."root/password".path;
    };
  };
}
