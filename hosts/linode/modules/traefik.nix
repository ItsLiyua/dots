{ config, ... }:
{
  networking.firewall.allowedTCPPorts = [
    80
    443
    8080
  ];
  services.traefik = {
    enable = true;
    staticConfigOptions = {
      log.level = "DEBUG";
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
      certificatesResolvers.myresolver.acme = {
        email = "liyua@duck.com";
        storage = "${config.services.traefik.dataDir}/acme.json";
        httpChallenge.entryPoint = "web";
      };
    };
    dynamicConfigOptions = {
      http = {
        routers = {
          api = {
            rule = "Host(`traefik.liyua.moe`)";
            service = "api@internal";
            middlewares = [ "auth" ];
          };
        };
        middlewares.auth.basicAuth.users = [
          "liyua:$y$j9T$Uj3UPs0HlUFyY7ERQWd9I.$hk/ORnNO77QUKIsKwt2GUXLb8H42yTOCVtomnEbm7x9"
        ];
      };
    };
  };
}
