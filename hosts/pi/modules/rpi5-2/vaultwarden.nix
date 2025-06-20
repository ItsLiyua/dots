{ config, ... }:
{
  sops.secrets."vaultwarden/envFile" = { };
  services.vaultwarden = {
    enable = true;
    environmentFile = config.sops.secrets."vaultwarden/envFile".path;
  };
}
