{
  programs.nixvim.plugins.ts-autotag = {
    enable = true;
    lazyLoad.settings = {
      ft = [
        "typescriptreact"
        "html"
      ];
    };
    settings.opts = {
      enable_close = true;
      enable_close_on_slash = true;
      enable_rename = true;
    };
  };
}
