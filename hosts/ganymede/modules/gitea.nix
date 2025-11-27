{
  services.gitea = {
    enable = true;
    stateDir = "/export/shared/internal/gitea";
    lfs.enable = true;
    settings = {
      server = {
        SSH_PORT = 2222;
        DOMAIN = "";
      };
      # service.DISABLE_REGISTRATION = true;
    };
  };
}
