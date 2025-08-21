{ config, ... }:
{
  programs = {
    zsh.shellAliases.ls = "${config.programs.eza.package}/bin/eza --group-directories-first";
    eza = {
      enable = true;
      colors = "always";
      git = true;
      icons = "always";
    };
  };
}
