{ config, myLib, ... }:
{
  sops.secrets.radicale = {
    owner = "radicale";
    sopsFile = myLib.sopsFileSystem;
  };
  networking.firewall.allowedTCPPorts = [ 5232 ];
  services.radicale = {
    enable = true;
    settings = {
      server.hosts = [ "0.0.0.0:5232" ];
      auth = {
        type = "htpasswd";
        htpasswd_filename = config.sops.secrets.radicale.path;
        htpasswd_encryption = "autodetect";
      };
    };
  };
}
