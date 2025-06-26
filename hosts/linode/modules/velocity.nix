{ config, pkgs, ... }:
{
  sops.secrets.velocity.owner = "minecraft";
  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
    servers.proxy = {
      enable = true;
      package = pkgs.velocityServers.velocity;
      stopCommand = "stop";
      files = {
        "velocity.toml".value = {
          config-version = "2.5";
          bind = "0.0.0.0:25565";
          motd = "<red>This server is currently offline.</red>";
          online-mode = true;
          ping-passthrough = "ALL";
          servers = {
            smp = "10.15.0.2:25565";
            try = [ "smp" ];
          };
          forced-hosts.smp = [ "smp" ];
          player-info-forwarding-mode = "modern";
          forwarding-secret-file = config.sops.secrets.velocity.path;
        };
        "plugins/bStats/config.txt".value = [ "enabled=false" ];
      };
    };
  };
}
