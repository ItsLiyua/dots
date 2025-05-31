{
  config,
  lib,
  ...
}: {
  imports = [
    ./btop.nix
    ./cava.nix
    ./clipboard.nix
    ./extras.nix
    ./fastfetch.nix
    ./git.nix
    ./unfree-whitelist.nix
    ./ssh.nix
    ./steamcfg.nix
    ./xdg.nix
    ./zsh.nix
  ];
  options.liyua = {
    cli.enable = lib.mkEnableOption "Custom CLI setup";
    utils.enable = lib.mkEnableOption "Misc utils";
  };
  config.liyua = {
    cli = with config.liyua.cli; {
      btop.enable = lib.mkDefault enable;
      cava.enable = lib.mkDefault enable;
      extras.enable = lib.mkDefault enable;
      fastfetch.enable = lib.mkDefault enable;
      git.enable = lib.mkDefault enable;
      ssh.enable = lib.mkDefault enable;
      zsh.enable = lib.mkDefault enable;
    };
    utils = with config.liyua.utils; {
      clipboard.enable = lib.mkDefault enable;
      steamcfg.enable = lib.mkDefault enable;
      xdg.enable = lib.mkDefault enable;
    };
  };
}
