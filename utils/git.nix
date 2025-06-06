{ config, lib, ... }:
{
  options.liyua.cli.git.enable = lib.mkEnableOption "Git";
  config.programs.git = lib.mkIf config.liyua.cli.git.enable {
    enable = true;
    userName = "Liyua";
    userEmail = "liyua@duck.com";
    lfs.enable = true;
    extraConfig = {
      init.defaultBranch = "master";
      push.autoSetupRemote = true;
      pull.rebase = false;
    };
  };
}
