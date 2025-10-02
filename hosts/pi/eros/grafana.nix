{
  services.grafana = {
    enable = true;
    openFirewall = true;
    settings = {
      server = {
        http_addr = "0.0.0.0";
        http_port = 3000;
      };
    };
    provision.datasources.settings.datasources = [
      {
        url = "localhost:9090";
        name = "Prometheus";
        type = "prometheus";
      }
    ];
  };
}
