{ pkgs, ... }:
{
  programs.zsh.shellAliases.du = "${pkgs.dust}/bin/dust";
}
