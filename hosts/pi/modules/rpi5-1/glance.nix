{
  services.glance = {
    enable = true;
    openFirewall = true;
    settings = {
      server = {
        host = "0.0.0.0";
        port = 7575;
      };
      pages = [ ];
    };
  };
}
