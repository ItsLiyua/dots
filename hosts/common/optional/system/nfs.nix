{ config, lib, ... }:
lib.mkIf config.liyua.nfs.enable {
  fileSystems."/mnt/nfs" = {
    device = "localhost:/export";
    fsType = "nfs";
    options = [
      "nfsvers=4.2"
      "nofail"
    ];
  };
}
