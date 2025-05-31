{
  config,
  lib,
  pkgs,
  ...
}: {
  options.liyua.cli.extras.enable = lib.mkEnableOption "Several smaller utility packages";
  config.home.packages = with pkgs;
    lib.mkIf config.liyua.cli.extras.enable [
      tokei
      wiki-tui
      du-dust
    ];
}
