{
  networking.firewall.allowedTCPPorts = [ 8222 ];
  services.vaultwarden = {
    enable = true;
    config = {
      DOMAIN = "https://vault.liyua.moe";
      SIGNUPS_ALLOWED = false;
      ROCKET_ADDRESS = "0.0.0.0";
      ROCKET_PORT = 8222;
      EXTENDED_LOGGING = true;
      LOG_LEVEL = "warn";
    };
  };
}
