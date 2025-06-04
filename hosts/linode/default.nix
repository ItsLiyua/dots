{
  config.liyua = {
    apps.enable = false;
    desktop.enable = false;
      nvim = {
        enable = true;
        lsp.enable = true;
      };
    cli = {
      enable = true;
      cava.enable = false;
    };
    utils.enable = false;
  };
}
