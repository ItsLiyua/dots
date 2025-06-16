{ config, ... }:
{
  sops.secrets = {
    "users/liyua/password".neededForUsers = true;
    "users/root/password".neededForUsers = true;
  };
  users = {
    mutableUsers = false;
    users = {
      liyua = {
        description = "Liyua";
        isNormalUser = true;
        useDefaultShell = true;
        hashedPasswordFile = config.sops.secrets."users/liyua/password".path;
        extraGroups = [
          "wheel"
          "networkmanager"
          "audio"
          "video"
          "input"
          "power"
        ];
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIIQcmoKJxqALKZJIFwuM0mcT0EPlkvlMaGXSEXb0zyd liyua"
        ];
      };
      root.hashedPasswordFile = config.sops.secrets."users/root/password".path;
    };
  };
}
