{
  services.glance = {
    enable = true;
    openFirewall = true;
    settings = {
      server.port = 7575;
      pages = [ ];
    };
  };
}
