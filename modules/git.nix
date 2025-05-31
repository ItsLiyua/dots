{
  config,
  lib,
  ...
}: {
  options.liyua.git.enable = lib.mkEnableOption "Git configuration";
  config.programs.git = lib.mkIf config.liyua.git.enable {
    enable = true;
    config = {
      init.defaultBranch = "master";
      url."https://github.com/".insteadOf = ["gh:" "github:"];
      safe.directory = "/home/liyua/nix";
    };
  };
}
