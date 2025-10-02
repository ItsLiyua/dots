{
  services.grafana = {
    enable = true;
    openFirewall = true;
    settings = {
      server.http_port = 3000;
    };
  };
}
