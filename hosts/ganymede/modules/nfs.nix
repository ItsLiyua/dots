{ config, lib, ... }:
let
  enable = true;
in
lib.mkIf enable {
  networking.firewall.allowedTCPPorts = [ 2049 ];
  users = {
    users.nfsanon = {
      isSystemUser = true;
      createHome = false;
      group = "nfsanon";
      uid = 10069;
    };
    groups.nfsanon = {
      name = "nfsanon";
      gid = 10069;
    };
  };
  services.nfs.server =
    let
      options = "rw,wdelay,nohide,no_subtree_check,all_squash,anongid=${toString config.users.groups.nfsanon.gid},anonuid=${toString config.users.users.nfsanon.uid}";
    in
    {
      enable = true;
      exports = ''
        /export/music   10.100.0.0/24(${options})
        /export/movies  10.100.0.0/24(${options}) 
        /export/anime   10.100.0.0/24(${options})
        /export/shared   10.100.0.0/24(${options})
      '';
    };
}
