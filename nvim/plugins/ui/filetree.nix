{
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;
      eventHandlers.file_open_requested = ''
        function()
          require('neo-tree.command').execute({ action = 'close' }) 
        end
      '';
    };
    keymaps = [
      {
        key = "<C-n>";
        mode = [
          "n"
          "v"
        ];
        action = "<cmd>Neotree<CR>";
        options = {
          silent = true;
          desc = "Open filetree";
        };
      }
    ];
  };
}
