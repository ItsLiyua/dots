{
  config,
  lib,
  pkgs,
  ...
}:
{
  sops.secrets = {
    "liyua/gpg/private" = { };
    "liyua/gpg/public" = { };
  };
  home.activation.import-gpg-key = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    run ${pkgs.gnupg}/bin/gpg --import "${config.sops.secrets."liyua/gpg/private".path}" $VERBOSE_ARG
  '';
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
