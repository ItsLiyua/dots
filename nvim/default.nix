{
  config,
  lib,
  ...
}:
{
  imports = [
    ./editor
    ./languages
    ./ui
    ./misc
  ];
  options.liyua.nvim = {
    enable = lib.mkEnableOption "Nvim configuration";
    lsp.enable = lib.mkEnableOption "(most likely quite resource intensive) LSP support";
  };
  config.programs.nvf = {
    enable = true;
    settings.vim = {
      viAlias = false;
      vimAlias = true;
      lsp.enable = config.liyua.nvim.lsp.enable;
      languages = {
        enableTreesitter = true;
        enableFormat = true;
      };
      treesitter.enable = true;
      binds.whichKey.enable = true;
      syntaxHighlighting = true;
      autocomplete.blink-cmp.enable = true;
      keymaps = [
        {
          key = "<leader>lf";
          mode = [ "n" ];
          action = ''function()require("conform").format()end'';
          lua = true;
          desc = "Format file";
        }
      ];
    };
  };
}
