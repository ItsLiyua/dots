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
          "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIN0+B3yM7FqDHXq/F99ZAvnM3Vap1u9+g59NXfDk34lQAAAABHNzaDo= liyua@nano"
          "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAICdngkr57QIPqK6Lm4235y61BUG9jjU1fJioVZRWb2zIAAAABHNzaDo= liyua@nfc"
        ];
      };
      root.hashedPasswordFile = config.sops.secrets."users/root/password".path;
    };
  };
}
