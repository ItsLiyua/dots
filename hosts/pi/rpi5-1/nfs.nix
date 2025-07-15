{
  networking.firewall.allowedTCPPorts = [
    111
    2049
  ];
  networking.firewall.allowedUDPPorts = [
    111
    2049
  ];
  services.nfs = {
    settings.exports.rootDir = "/var/exports";
    server = {
      enable = true;
      createMountPoints = true;
      exports = ''
        /music 10.15.0.0/24(rw,no_subtree_check)
      '';
    };
  };
}
