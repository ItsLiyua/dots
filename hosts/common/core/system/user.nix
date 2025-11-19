{ config, myLib, ... }:
{
  users = {
    mutableUsers = false;
    users = {
      liyua = {
        description = "Liyua";
        isNormalUser = true;
        useDefaultShell = true;
        # hashedPasswordFile = config.sops.secrets."users/liyua/password".path; # TODO: Sops with private repo on gitea
        hashedPassword = "$y$j9T$1v9ITJy5MI4R5VN21LdvC.$UpLLf0ur1fYg8wod9j0oQy8gNcNMrQzSb1ALkF8X6A7";
        extraGroups = [
          "wheel"
          "power"
        ];
        openssh.authorizedKeys.keyFiles = with myLib; [
          (relativeToRoot "keys/id_nfc.pub")
          (relativeToRoot "keys/id_nfc-c.pub")
          (relativeToRoot "keys/id_nano.pub")
          (relativeToRoot "keys/id_liyua.pub")
        ];
      };
    };
  };
}
