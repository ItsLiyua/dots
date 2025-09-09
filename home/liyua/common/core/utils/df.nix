{ pkgs, ... }:
{
  programs.zsh.shellAliases.df = "${pkgs.pydf}/bin/df";
}
