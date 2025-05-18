{ config, lib, pkgs, ... }: {
  # home.packages = [ pkgs.bibata-cursors ];
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "Bibata-Modern-Ice";
    size = 12;
    package = pkgs.bibata-cursors;
  };
}
