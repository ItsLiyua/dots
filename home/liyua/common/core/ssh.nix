{ config, lib, ... }:
{
  programs.ssh = {
    enable = true;
    matchBlocks =
      let
        identityFile = "${config.home.homeDirectory}/.ssh/id_yubikey"; # TODO: Do not hardcode this path. Declare var to be used in device specific home configurations so that it only needs to be changed in one place
        mkCfgStdKey = hostname: {
          inherit hostname identityFile;
          user = config.home.username;
        };
      in
      (
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
            inherit identityFile;
          };
          "gitlab.com" = {
            hostname = "gitlab.com";
            user = "git";
            inherit identityFile;
          };
        }
      );
  };
}
