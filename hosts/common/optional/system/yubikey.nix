{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.liyua.yubikey.enable {
  environment.systemPackages = with pkgs; [
    yubioath-flutter
    yubikey-manager
  ];

  services = {
    pcscd.enable = true;
    udev.packages = [ pkgs.yubikey-personalization ];
    yubikey-agent.enable = true;
  };
}
