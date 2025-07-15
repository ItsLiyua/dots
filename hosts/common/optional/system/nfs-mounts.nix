{ config, lib, ... }:
{
  fileSystems."/mnt/music" = lib.mkIf config.liyua.nfs.music.enable {
    device = "10.15.0.3:/music";
    fsType = "nfs";
    options = [
      "rw"
      "nfsvers=4.2"
      "x-systemd.automount"
      "noauto"
      "x-systemd.idle-timeout=600"
    ];
  };
}
