{
  config,
  lib,
  ...
}: {
  options.liyua.cli.ssh.enable = lib.mkEnableOption "Custom SSH configuration";
  config.programs.ssh = lib.mkIf config.liyua.cli.ssh.enable {
    enable = true;
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
      };
      "liberty" = {
        hostname = "liberty";
        user = "liyua";
        identityFile = "~/.ssh/id_ed25519";
      };
      "resolute" = {
        hostname = "resolute";
        user = "liyua";
        identityFile = "~/.ssh/id_ed25519";
      };
    };
  };
}
