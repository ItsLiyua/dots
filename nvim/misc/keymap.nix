{
  programs.nixvim.keymaps = [
    {
      action = "<cmd>nohl<CR>";
      key = "<esc>";
      mode = "n";
      options.silent = true;
    }
  ];
}
