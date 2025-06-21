{ config, ... }:
{
  sops.secrets."radicale/login".owner = "radicale";
  networking.firewall.allowedTCPPorts = [ 5232 ];
  services.radicale = {
    enable = true;
    settings = {
      server.hosts = [ "0.0.0.0:5232" ];
      auth = {
        type = "htpasswd";
        htpasswd_filename = config.sops.secrets."radicale/login".path;
        htpasswd_encryption = "autodetect";
      };
    };
  };
}
