{ config, lib, ... }:
{
  sops.secrets."liyua/ssh" = lib.mkIf config.liyua.remoteAccess.enable {
    path = "${config.home.homeDirectory}/.ssh/id_ed25519";
  };
}
