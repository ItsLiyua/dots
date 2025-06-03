{
  config,
  lib,
  ...
}:
{
  options.liyua.nvim.misc.clipboard.enable = lib.mkEnableOption "Clipboard integration";
  config = {
    liyua.nvim.misc.clipboard.enable = config.liyua.nvim.misc.enable;
    programs.nvf.settings.vim.clipboard = {
      enable = true;
      providers.wl-copy.enable = true;
      registers = "unnamedplus";
    };
  };
}
