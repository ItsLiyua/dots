{ config, lib, ... }:
{
  options.liyua.nvim.ui.lualine.enable = lib.mkEnableOption "LuaLine";
  config = {
    liyua.nvim.ui.lualine.enable = lib.mkDefault config.liyua.nvim.ui.enable;
    programs.nvf.settings.vim.statusline.lualine.enable = config.liyua.nvim.ui.lualine.enable;
  };
}
