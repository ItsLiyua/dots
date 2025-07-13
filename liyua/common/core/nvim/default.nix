{
  imports = [
    ./plugins
    ./keybinds.nix
    ./options.nix
  ];
  stylix.targets.nvf.enable = true;
  programs.nvf = {
    enable = true;
    settings.vim.vimAlias = true;
  };
}
