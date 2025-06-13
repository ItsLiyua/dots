{ lib ,...}:
{
  config.vim = {
    filetree.neo-tree = {
      enable = true;
      setupOpts = {
        auto_clean_after_session_restore = true;
        event_handlers = [
          {
            event = "file_open_requested";
            handler = lib.mkLuaInline ''function() require("neo-tree.command").execute({ action = "close" }) end'';
          }
        ];
      };
    };
    keymaps = [
      {
        key = "<C-n>";
        mode = "n";
        silent = true;
        action = "<cmd>Neotree<CR>";
      }
    ];
  };
}
