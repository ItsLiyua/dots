{ config, lib, ... }:
{
  options.liyua.yubikey = {
    enable = lib.mkEnableOption "Yubikey support for SSH signing and so on";
    usedKey = lib.mkOption {
      type =
        with lib.types;
        nullOr (enum [
          "nano"
          "nfc"
          "nfc-c"
        ]);
      default = null;
      description = "The key to use for this device";
    };
  };
  config = lib.mkIf config.liyua.yubikey.enable {
    sops.secrets = {
      "liyua/yubikey/${config.liyua.yubikey.usedKey}/ssh".path =
        "${config.home.homeDirectory}/.ssh/id_yubikey";
      "liyua/yubikey/${config.liyua.yubikey.usedKey}/uni-ssh".path =
        "${config.home.homeDirectory}/.ssh/id_uni_yubikey";
      "liyua/yubikey/u2f_keys".path = "${config.home.homeDirectory}/.config/Yubico/u2f_keys";
    };

  };
}
