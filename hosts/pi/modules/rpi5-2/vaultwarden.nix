{ config, ... }:
{
  sops.secrets."vaultwarden/envFile".owner = "vaultwarden";
  services.vaultwarden = {
    enable = true;
    environmentFile = config.sops.secrets."vaultwarden/envFile".path;
  };
}
