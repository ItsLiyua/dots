{ lib, ... }:
let
  enable = true;
in
lib.mkIf enable {
  liyua.nfs.enable = true;
  networking.firewall.allowedTCPPorts = [ 2049 ];
  services.nfs.server = {
    enable = true;
    exports = ''
      /export 10.100.0.0/24(rw,nohide,no_subtree_check) 127.0.0.0/24(rw,nohide,no_subtree_check)
    '';
  };
}
