{
  networking.firewall.allowedTCPPorts = [
    3000
    2222
  ];
  networking.firewall.allowedUDPPorts = [
    3000
    2222
  ];
  services.gitea = {
    enable = true;
    stateDir = "/export/shared/internal/gitea";
    lfs.enable = true;
    database = {
      createDatabase = true;
      type = "sqlite3";
    };
    settings = {
      server = {
        SSH_PORT = 2222;
        DOMAIN = "10.15.0.7";
      };
      # service.DISABLE_REGISTRATION = true;
    };
  };
}
