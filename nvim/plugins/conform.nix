{ pkgs, ... }: {
  home.packages = with pkgs; [ stylua ];
  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    lazyLoad.settings = {
      cmd = "Conform";
      ft = [ "lua" ];
    };
    settings = {
      lua = [ "stylua" ];
    };
  };
}
