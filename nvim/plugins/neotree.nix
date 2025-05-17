{
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;
      closeIfLastWindow = true;
      eventHandlers.file_opened = ''function(file_path) require("neo-tree").close_all() end'';
      popupBorderStyle = "rounded";
    };
    keymaps = [
      {
        action = "<cmd>Neotree toggle<CR>";
        key = "<C-n>";
        options.silent = true;
      }
    ];
  };
}
