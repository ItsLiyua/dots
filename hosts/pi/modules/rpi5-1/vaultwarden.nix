{
  services.vaultwarden = {
    enable = true;
    config = {
      DOMAIN = "https://vault.liyua.moe";
      SIGNUPS_ALLOWED = false;
      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = 8222;
      EXTENDED_LOGGING = true;
      LOG_LEVEL = "warn";
    };
  };
}
