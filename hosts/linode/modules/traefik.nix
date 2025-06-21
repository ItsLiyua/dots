{ config, ... }:
{
  sops.secrets."traefik/dashboard".owner = "traefik";
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
            tls.certResolver = "myresolver";
            entrypoints = "websecure";
          };
          vaultwarden = {
            rule = "Host(`vault.liyua.moe`)";
            service = "vaultwarden";
            tls.certResolver = "myresolver";
            entrypoints = "websecure";
          };
        };
        services.vaultwarden.loadBalancer.servers = [ { url = "http://10.15.0.3:8222"; } ];
        middlewares.auth.basicAuth.usersFile = config.sops.secrets."traefik/dashboard".path;
      };
    };
  };
}
