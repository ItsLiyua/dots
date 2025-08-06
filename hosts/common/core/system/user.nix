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
          "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIEPpajMKIasGtpVm4gENSNSjv2kpQOvFLCRUgskWG0JQAAAABHNzaDo= liyua@nano"
          "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAILFvTeOeNAW3Aw7gszKPPpWZWP++WpJj/nCwVPMo/1SmAAAABHNzaDo= liyua@nfc"
        ];
      };
      root.hashedPasswordFile = config.sops.secrets."users/root/password".path;
    };
  };
}
