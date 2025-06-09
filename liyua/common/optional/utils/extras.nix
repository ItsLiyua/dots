{
  config,
  lib,
  pkgs,
  ...
}:
{
  # TODO: Switch for this
  config.home.packages = with pkgs; [
    tokei
    wiki-tui
    du-dust
  ];
}
