{ config, ... }:
{
  sops.secrets = {
    "liyua/gpg/private" = { };
    "liyua/gpg/public" = { };
  };
  programs.gpg = {
    enable = true;
    publicKeys = [
      {
        source = config.sops.secrets."liyua/gpg/public".path;
        trust = "ultimate";
      }
    ];
  };
}
