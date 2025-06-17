{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.sops ];
  sops = {
    defaultSopsFile = ../../../../secrets.yaml;
    validateSopsFiles = true;

    age = {
      # sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      # keyFile = "/var/lib/sops-nix/key.txt";
      keyFile = "/home/liyua/.config/sops/age/keys.txt";
      generateKey = true;
    };
  };
}
