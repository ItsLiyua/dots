{ lib, pkgs, ... }:
{
  environment.systemPackages = [ pkgs.sops ];
  sops = {
    defaultSopsFile = lib.liyua.relativeToRoot "./secrets/system.yaml";
    validateSopsFiles = true;

    age = {
      sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };
  };
}
