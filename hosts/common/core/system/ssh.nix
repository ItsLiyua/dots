{ config, myLib, ... }:
let
  port = 22;
  keyLocation = "ssh/keys"; # Inside /etc
in
{
  sops.secrets.git = { };
  networking.firewall.allowedTCPPorts = [ port ];

  services.openssh = {
    enable = true;
    ports = [ port ];
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      AllowUsers = null;
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "no";
    };
  };

  environment.etc."${keyLocation}/id_git.pub".source = myLib.relativeToRoot "keys/id_git.pub";
  environment.etc."${keyLocation}/id_git".source = config.sops.secrets.git.path;

  programs.ssh.extraConfig = ''
    Host github.com
      User git
      HostName github.com
      IdentityFile /etc/${keyLocation}/id_git
    Host gitlab.com
      User git
      HostName github.com
      IdentityFile /etc/${keyLocation}/id_git
  '';
}
