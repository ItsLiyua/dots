{
  config,
  lib,
  myLib,
  ...
}:
(
  let
    port = 22;
  in
  {
    options.liyua.ssh.enableRootAccess = lib.mkEnableOption "Root access via ssh";
    config = {
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
          PermitRootLogin = "prohibit-password";
        };
      };

      programs.ssh.startAgent = true;

      users.users.root.openssh.authorizedKeys.keyFiles = lib.mkIf config.liyua.ssh.enableRootAccess (
        lib.warn "ENABLED SSH ROOT ACCESS. DISABLE AS SOON AS POSSIBLE" (
          with myLib;
          [
            (relativeToRoot "keys/id_liyua.pub")
            (relativeToRoot "keys/id_nfc.pub")
            (relativeToRoot "keys/id_nfc-c.pub")
            (relativeToRoot "keys/id_nano.pub")
          ]
        )
      );
    };
  }
)
