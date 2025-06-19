{
  services.traefik = {
    enable = true;
    staticConfigOptions = {
      api.dashboard = false;
      entryPoints.smp.address = ":25566";
    };
    dynamicConfigOptions = {
      tcp = {
        routers.smp = {
          entryPoints = [ "smp" ];
          rule = "Host('liyua.moe')";
          service = "smp";
        };
        services.smp.loadBalancer.servers.url = [ "10.15.0.3:25566" ];
      };
    };
  };
}
