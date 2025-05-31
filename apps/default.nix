{
  config,
  lib,
  ...
}: {
  imports = [
    ./foot.nix
    ./firefox.nix
    ./discord.nix
    ./nautilus.nix
    ./prismlauncher.nix
  ];
  options.liyua.apps.enable = lib.mkEnableOption "Desktop Apps";
  config.liyua.apps = {
    discord.enable = lib.mkDefault config.liyua.apps.enable;
    firefox.enable = lib.mkDefault config.liyua.apps.enable;
    foot.enable = lib.mkDefault config.liyua.apps.enable;
    nautilus.enable = lib.mkDefault config.liyua.apps.enable;
    prismlauncher.enable = lib.mkDefault config.liyua.apps.enable;
  };
}
