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
          "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIM6+1cR0P5EjO26/+LzJODBxOJzR9I3m0tNM6c5J/OYVAAAABHNzaDo= liyua@nano"
          "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIL7rfMuc1NerL/NTnkABcwIuZNSlUz9AnowvIUDT6LN4AAAABHNzaDo= liyua@nfc"
        ];
      };
      root.hashedPasswordFile = config.sops.secrets."users/root/password".path;
    };
  };
}
