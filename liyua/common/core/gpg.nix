{ config, ... }:
{
  sops.secrets = {
    "liyua/private-gpg" = { };
    "liyua/public-gpg" = { };
  };
  programs.gpg = {
    enable = true;
    publicKeys = [
      {
        source = config.sops.secrets."liyua/public-gpg".path;
        trust = "ultimate";
      }
    ];
  };
}
