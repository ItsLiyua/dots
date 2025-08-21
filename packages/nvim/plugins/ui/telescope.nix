{ lib, ... }:
{
  vim.telescope = {
    enable = true;
    mappings.findFiles = "<leader><leader>";
    setupOpts.defaults.mappings.i = {
      "<C-j>" = lib.mkLuaInline ''
        require("telescope.actions").move_selection_next
      '';
      "<C-k>" = lib.mkLuaInline ''
        require("telescope.actions").move_selection_previous
      '';
      "<Esc>" = lib.mkLuaInline ''
        require("telescope.actions").close
      '';
    };
  };
}
