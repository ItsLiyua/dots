{ pkgs, ... }:
{
  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
    servers.proxy = {
      enable = true;
      package = pkgs.velocityServers.velocity;
      stopCommand = "end";
      files."velocity.toml".value = {
        config-version = "2.5";
        bind = "0.0.0.0:25565";
        motd = "Velocity Procy";
        online-mode = true;
        servers.test = "10.15.0.2:25565";
        forced-hosts.test = [ "test" ];
        player-info-forwarding-mode = "legacy";
      };
    };
  };
}
