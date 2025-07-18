{ config, lib, ... }:
{
  sops.secrets = {
    "liyua/git/public".path = "${config.home.homeDirectory}/.ssh/id_github.pub";
    "liyua/git/private".path = "${config.home.homeDirectory}/.ssh/id_github";
  };
  programs.ssh =
    let
      mkCfgStdKey = hostname: {
        inherit hostname;
        user = "liyua";
        identityFile = "~/.ssh/id_ed25519";
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
        ] (hostname: mkCfgStdKey "${hostname}.local")
        // {
          linode = mkCfgStdKey "liyua.moe";
        }
        // (lib.genAttrs [ "github.com" "gitlab.com" ] (hostname: {
          ${hostname} = {
            hostname = "github.com";
            user = "git";
            identityFile = "~/.ssh/id_github";
          };
        }));
    };
}
