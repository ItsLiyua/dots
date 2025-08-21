{ config, ... }:
{
  programs = {
    zsh = {
      enable = true;
      dotDir = "${config.xdg.configHome}/zsh";
      history = {
        path = "${config.xdg.cacheHome}/zsh_history";
        size = 10000;
        append = true;
        saveNoDups = true;
        share = true;
        ignoreSpace = true;
      };
      shellAliases = {
        c = "clear";
        j = "just";
        v = "nvim";
        ll = "ls -l";
        la = "ls -la";
      };
    };
  };
}
