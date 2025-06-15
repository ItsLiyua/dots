{
  imports = [
    ./plugins
    ./options.nix
  ];
  programs.nvf = {
    enable = true;
    settings.vim = {
      vimAlias = true;
    };
  };
}
