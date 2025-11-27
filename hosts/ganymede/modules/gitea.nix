{
  services.gitea = {
    enable = true;
    stateDir = "/export/shared/internal/gitea";
    lfs.enable = true;
    settings = {
      server = {
        SSH_PORT = 2222;
        DOMAIN = "10.15.0.7";
      };
      # service.DISABLE_REGISTRATION = true;
    };
  };
}
