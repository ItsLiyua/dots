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
        action = "<cmd>Neotree<CR>";
        key = "<C-n>";
        mode = [
          "n"
          "v"
        ];
        options = {
          desc = "Filetree";
          silent = true;
        };
      }
    ];
  };
}
