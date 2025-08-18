{ config, myLib, ... }:
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
        openssh.authorizedKeys.keyFiles = with myLib; [
          (relativeToRoot "keys/id_liyua.pub")
          (relativeToRoot "keys/id_nfc.pub")
          (relativeToRoot "keys/id_nano.pub")
        ];
      };
      root.hashedPasswordFile = config.sops.secrets."users/root/password".path;
    };
  };
}
