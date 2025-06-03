{ config, lib, ... }:
{
  options.liyua.nvim.ui.telescope.enable = lib.mkEnableOption "Telescope";
  config = {
    liyua.nvim.ui.telescope.enable = lib.mkDefault config.liyua.nvim.ui.enable;
    programs.nvf.settings.vim = lib.mkIf config.liyua.nvim.ui.telescope.enable {
      telescope.enable = true;
      keymaps = [
        {
          key = "<leader><leader>";
          action = "<cmd>Telescope smart_open<CR>";
          mode = [ "n" ];
          desc = "Smart open";
        }
      ];
    };
  };
}
