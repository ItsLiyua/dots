{ config, ... }:
{
  networking.firewall.allowedTCPPorts = [
    80
    443
  ];
  services.traefik = {
    enable = true;
    staticConfigOptions = {
      log.level = "WARN";
      api.dashboard = true;
      entryPoints = {
        web = {
          address = ":80";
          http.redirections.entryPoint = {
            to = "websecure";
            scheme = "https";
          };
        };
        websecure = {
          address = ":443";
          http.tls.certResolver = "myresolver";
        };
      };
      certificateResolvers.myresolver.acme = {
        email = "liyua@duck.com";
        storage = "${config.services.traefik.dataDir}/acme.json";
        caserver = "https://acme-v02.api.letsencrypt.org/directory";
        httpchallenge.entryPoint = "web";
      };
    };
    dynamicConfigOptions = {
      routers = {
        api = {
          rule = "Host(`traefik.liyua.moe`)";
          service = "api@internal";
          tls.certResolver = "myresolver";
        };
      };
    };
  };
}
