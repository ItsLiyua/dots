{ lib, ... }:
{
  vim = {
    filetree.neo-tree = {
      enable = true;
      setupOpts.event_handlers = [
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
