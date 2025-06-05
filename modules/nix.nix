{
  nix.settings.experimental-features =
    [ "nix-command" "flakes" "pipe-operators" ];
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}
