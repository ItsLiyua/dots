{
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;
      closeIfLastWindow = true;
      eventHandlers.file_opened = ''function(file_path) require("neo-tree").close_all() end'';
      popupBorderStyle = "rounded";
      filesystem.followCurrentFile.enabled = true;
    };
    plugins.bufferline.settings.options.offsets = [
      {
        filetype = "neo-tree";
        text = "File Explorer";
        text_align = "center";
        separator = true;
      }
    ];
    keymaps = [
      {
        action = "<cmd>Neotree focus<CR>";
        key = "<C-n>";
        options.silent = true;
      }
    ];
  };
}
