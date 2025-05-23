{pkgs, ...}: {
  home.packages = with pkgs; [
    tokei
    wiki-tui
    du-dust
  ];
}
