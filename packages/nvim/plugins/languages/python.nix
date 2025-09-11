{
  vim.languages.python = {
    enable = true;
    format = {
      enable = true;
      type = "black-and-isort";
    };
    lsp.enable = true;
    treesitter.enable = true;
  };
}
