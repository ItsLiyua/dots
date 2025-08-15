{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    wget
    unzip
    killall
    home-manager
  ];
}
