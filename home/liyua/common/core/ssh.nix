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
        }
      );
    includes = [ config.sops.secrets."liyua/uni/sshconfig".path ];
  };
}
