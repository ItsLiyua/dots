{ config, myLib, ... }:
{
  sops.secrets.traefik = {
    owner = "traefik";
    sopsFile = myLib.sopsFileSystem;
  };
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
          radicale = {
            rule = "Host(`calendar.liyua.moe`)";
            service = "radicale";
            tls.certResolver = "myresolver";
            entrypoints = "websecure";
          };
          glance = {
            rule = "Host(`home.liyua.moe`)";
            service = "glance";
            tls.certResolver = "myresolver";
            entrypoints = "websecure";
          };
          jellyfin = {
            rule = "Host(`jelly.liyua.moe`)";
            service = "jellyfin";
            tls.certResolver = "myresolver";
            entrypoints = "websecure";
          };
          grafana = {
            rule = "Host(`mon.liyua.moe`)";
            service = "grafana";
            tls.certResolver = "myresolver";
            entrypoints = "websecure";
          };
        };
        services =
          let
            erosIP = config.liyua.network.wireguard.devices.eros.assignedIP;
            ganymedeIP = config.liyua.network.wireguard.devices.ganymede.assignedIP;
          in
          {
            vaultwarden.loadBalancer.servers = [ { url = "http://${erosIP}:8222"; } ];
            radicale.loadBalancer.servers = [ { url = "http://${erosIP}:5232"; } ];
            glance.loadBalancer.servers = [ { url = "http://${erosIP}:7575"; } ];
            jellyfin.loadBalancer.servers = [ { url = "http://${ganymedeIP}:8096"; } ];
            grafana.loadBalancer.servers = [ { url = "http://${erosIP}:3000"; } ];
          };
        middlewares.auth.basicAuth.usersFile = config.sops.secrets.traefik.path;
      };
    };
  };
}
