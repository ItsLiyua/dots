let
  port = 22;
in
{
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
}
