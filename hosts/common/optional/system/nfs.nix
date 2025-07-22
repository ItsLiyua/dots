{ config, lib, ... }:
lib.mkIf config.liyua.nfs.enable {
  fileSystems."/mnt/nfs" = {
    device = "rpi5-1.local:/export";
    fsType = "nfs";
    options = [
      "nfsvers=4.2"
      "nofail"
    ];
  };
}
