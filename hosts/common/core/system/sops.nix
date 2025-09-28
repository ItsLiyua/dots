{ myLib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    sops
    age
  ];
  sops = {
    defaultSopsFile = myLib.relativeToRoot "secrets/hosts/common.yaml";
    validateSopsFiles = true;

    age = {
      sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };
  };
}
