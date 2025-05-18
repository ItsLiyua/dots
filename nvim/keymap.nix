{
  programs.nixvim = {
		globals.mapleader = " ";
    keymaps = [
      {
        action = "<cmd>w|bd<CR>";
        key = "<C-w>";
        mode = [ "n" ];
        options = {
          silent = true;
          desc = "Save and close tab";
        };
      }
      {
        action = "<cmd>w<CR>";
        key = "<C-s>";
        mode = [ "n" ];
        options = {
          silent = true;
          desc = "Save file";
        };
      }
      {
        action = "<cmd>bnext<CR>";
        key = "<Tab>";
        options = {
          silent = true;
          desc = "Cycle to next buffer";
        };
        mode = [ "n" ];
      }
      {
        action = "<cmd>bprevious<CR>";
        key = "<S-Tab>";
        options = {
          silent = true;
          desc = "Cycle to previous buffer";
        };
        mode = [ "n" ];
      }
    ] ++ map (key: {
      action = "<Nop>";
      key = "<${key}>";
      options.silent = true;
      mode = [ "n" "i" "v" ];
    }) [ "Up" "Down" "Left" "Right"]; # Disable Arrow Keys
  };
}
