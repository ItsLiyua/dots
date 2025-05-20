{
  programs.nixvim.plugins.typescript-tools = {
    enable = true;
    lazyLoad.settings.ft = [ "typescript" "typescriptreact" "javascript" ];
  };
}
