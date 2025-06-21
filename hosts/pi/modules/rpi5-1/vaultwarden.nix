{
  networking.firewall.allowedTCPPorts = [ 80 ];
  services.vaultwarden = {
    enable = true;
    config = {
      DOMAIN = "https://vault.liyua.moe";
      SIGNUPS_ALLOWED = false;
      ROCKET_ADDRESS = "10.15.0.3";
      ROCKET_PORT = 8222;
      EXTENDED_LOGGING = true;
      LOG_LEVEL = "warn";
    };
  };
}
