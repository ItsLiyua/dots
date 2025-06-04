{
  config.liyua = {
    apps.enable = false;
    desktop.enable = false;
    nvim = {
      enable = true;
      lsp.enable = false;
      editor.autocomplete.enable = false;
    };
    cli = {
      enable = true;
      cava.enable = false;
    };
    utils.enable = false;
  };
}
