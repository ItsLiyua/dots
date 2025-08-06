{ config, lib, ... }:
let
  dir = "${config.home.homeDirectory}/.ssh";
in
{
  sops.secrets = {
    "liyua/git/public".path = "${dir}/id_git.pub";
    "liyua/git/private".path = "${dir}/id_git";
    "liyua/yubikey/nfc/ssh".path = "${dir}/id_nfc";
    "liyua/yubikey/nano/ssh".path = "${dir}/id_nano";
  };
  programs.ssh =
    let
      mkCfgStdKey = hostname: {
        inherit hostname;
        user = "liyua";
        identityFile = [
          config.sops.secrets."liyua/yubikey/nfc/ssh".path
          config.sops.secrets."liyua/yubikey/nano/ssh".path
        ];
      };
    in
    {
      enable = true;
      matchBlocks =
        lib.genAttrs [
          "liberty"
          "resolute"
          "rpi5-1"
          "rpi5-2"
          "t480"
        ] (hostname: mkCfgStdKey "${hostname}.local")
        // {
          linode = mkCfgStdKey "liyua.moe";
          "github.com" = {
            hostname = "github.com";
            user = "git";
            identityFile = "~/.ssh/id_git";
          };
          "gitlab.com" = {
            hostname = "gitlab.com";
            user = "git";
            identityFile = "~/.ssh/id_git";
          };
        };
    };
}
