{ config, ... }:
{
  programs = {
    zsh.shellAliases.cat = "${config.programs.bat.package}/bin/bat";
    bat.enable = true;
  };
}
