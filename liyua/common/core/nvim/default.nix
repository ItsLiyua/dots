{
  imports = [
    ./plugins
    ./keybinds.nix
    ./options.nix
  ];
  programs.nvf = {
    enable = true;
    settings.vim.vimAlias = true;
  };
}
