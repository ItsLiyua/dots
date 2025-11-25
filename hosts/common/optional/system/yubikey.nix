{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.liyua.yubikey.enable {
  environment.systemPackages = with pkgs; [ yubikey-manager ];

  services = {
    pcscd.enable = true;
    udev.packages = [ pkgs.yubikey-personalization ];
    yubikey-agent.enable = true;
  };

  security.pam = {
    sshAgentAuth.enable = true;
    u2f = {
      enable = true;
      settings = {
        cue = true;
        authFile = "/home/liyua/.config/Yubico/u2f_keys";
      };
    };
    services.login.u2fAuth = true;
  };
}
