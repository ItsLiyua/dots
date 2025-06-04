{
  config,
  lib,
  ...
}:
{
  options.liyua.userAccount.enable = lib.mkEnableOption "Liyua's User Account";
  config = lib.mkIf config.liyua.userAccount.enable {
    sops.secrets.liyua-password.neededForUsers = true;
    users = {
      mutableUsers = false;
      users.liyua = {
        description = "Liyua";
        isNormalUser = true;
        useDefaultShell = true;
        hashedPasswordFile = config.sops.secrets.liyua-password.path;
        extraGroups = [
          "wheel"
          "networkmanager"
          "audio"
          "video"
          "input"
          "power"
        ];
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILtyKAptgaf6VNiQPw6GvoC8/89u5+PMsQsqa8G7R4J/ liyua@resolute"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHKZZyrwb0depJAXqeoN8+q8kquwgAHz3uRssneGDtp0 liyua@liberty"
        ];
      };
    };
  };
}
