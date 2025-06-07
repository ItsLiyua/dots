{ config, lib, ... }:
{
  options.liyua.nvim.ui.gitsigns.enable = lib.mkEnableOption "Git signs";
  config = {
    liyua.nvim.ui.gitsigns.enable = lib.mkDefault config.liyua.nvim.ui.enable;
    programs.nvf.settings.vim = lib.mkIf config.liyua.nvim.ui.gitsigns.enable {
      git.gitsigns.enable = true;
    };
  };
}
