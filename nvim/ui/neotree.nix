{ config, lib, ... }:
{
  options.liyua.nvim.ui.filetree.enable = lib.mkEnableOption "Filetree";
  config = {
    liyua.nvim.ui.filetree.enable = lib.mkDefault config.liyua.nvim.ui.enable;
    programs.nvf.settings.vim = lib.mkIf config.liyua.nvim.ui.filetree.enable {
      filetree.neo-tree = {
        enable = true;
        setupOpts = {
          enable_cursor_hijack = true;
          auto_clean_after_session_restore = true;
          event_handlers = [
            {
              event = "file_open_requested";
              handler = lib.mkLuaInline ''
                function()
                  require('neo-tree.command').execute({ action = 'close' }) 
                end
              '';
            }
          ];
        };
      };
      keymaps = [
        {
          key = "<C-n>";
          mode = [
            "n"
            "i"
            "v"
          ];
          action = "<cmd>Neotree<CR>";
          silent = true;
          desc = "Open filetree";
        }
      ];
    };
  };
}
