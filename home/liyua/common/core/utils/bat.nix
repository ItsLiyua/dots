{ config, ... }:
{
  stylix.targets.bat.enable = true;
  programs = {
    zsh.shellAliases.cat = "${config.programs.bat.package}/bin/bat";
    bat.enable = true;
  };
}
