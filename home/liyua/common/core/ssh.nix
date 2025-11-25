{
  config,
  lib,
  ...
}:
{
  sops.secrets."liyua/uni/sshconfig" = { };
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks =
      let
        identityFile = "${config.home.homeDirectory}/.ssh/id_yubikey"; # TODO: Do not hardcode this path. Declare var to be used in device specific home configurations so that it only needs to be changed in one place
        mkCfgStdKey = hostname: {
          inherit hostname identityFile;
          user = config.home.username;
        };
      in
      (
        lib.genAttrs [
          "razorback"
          "donnager"
          "eros"
          "ceres"
          "rocinante"
          "ganymede"
        ] (hostname: mkCfgStdKey "${hostname}.local")
        // {
          medina = mkCfgStdKey "liyua.moe";
          donnager = mkCfgStdKey "10.15.0.2";
          donnager-local = mkCfgStdKey "donnager.local";
          eros = mkCfgStdKey "10.15.0.3";
          eros-local = mkCfgStdKey "eros.local";
          ceres = mkCfgStdKey "10.15.0.4";
          ceres-local = mkCfgStdKey "ceres.local";
          razorback = mkCfgStdKey "10.15.0.5";
          razorback-local = mkCfgStdKey "razorback.local";
          rocinante = mkCfgStdKey "10.15.0.6";
          rocinante-local = mkCfgStdKey "rocinante.local";
          ganymede = mkCfgStdKey "10.15.0.7";
          ganymede-local = mkCfgStdKey "ganymede.local";
        }
      );
    includes = [ config.sops.secrets."liyua/uni/sshconfig".path ];
  };
}
