{ lib, ... }:
{
  vim = {
    filetree.neo-tree = {
      enable = true;
      setupOpts = {
        close_if_last_window = true;
        filesystem = {
          filtered_items = {
            visible = true;
            hide_dotfiles = false;
            hide_gitignored = false;
            hide_hidden = false;
          };
          follow_current_file.enabled = true;
        };
        event_handlers = [
          {
            event = "file_open_requested";
            handler = lib.mkLuaInline ''
              function()
                require("neo-tree.command").execute({ action = "close" })
              end
            '';
          }
        ];
      };
    };
    keymaps = [
      {
        key = "<C-n>";
        mode = [ "n" ];
        action = "<cmd>Neotree<CR>";
        silent = true;
        desc = "Open Filemanager";
      }
    ];
  };
}
