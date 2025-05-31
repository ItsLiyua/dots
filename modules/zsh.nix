{
  config,
  lib,
  pkgs,
  ...
}: {
  options.liyua.zsh.enable = lib.mkEnableOption "ZSH as the default shell";
  config = lib.mkIf config.liyua.zsh.enable {
    users.defaultUserShell = pkgs.zsh;
    programs.zsh = {
      enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      enableCompletion = true;
    };
  };
}
