{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wget
    btop
    unzip
    killall
  ];
  programs.dconf.enable = true;
}
