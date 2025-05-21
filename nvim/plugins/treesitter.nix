{pkgs, ...}: {
  programs.nixvim = {
    plugins.treesitter = {
      enable = true;
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        bash
        json
        lua
        markdown
        nix
        regex
        toml
        vim
        vimdoc
        xml
        yaml

        javascript
        typescript

        nix
      ];
      lazyLoad.settings = {
        cmd = ["TSInstall"];
        event = ["BufNewFile" "BufReadPre"];
      };
    };
  };
}
