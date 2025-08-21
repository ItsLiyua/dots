{ config, ... }:
{
  programs = {
    zsh.shellAliases.cat = "${config.programs.bat.package}";
    bat.enable = true;
  };
}
