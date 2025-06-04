{
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = [ pkgs.sops ];
  sops =
    let
      secretsPath = builtins.toString inputs.mysecrets;
    in
    {
      defaultSopsFile = "${secretsPath}/secrets.yaml";
      validateSopsFiles = false;

      age = {
        sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
        keyFile = "/var/lib/sops-nix/key.txt";
        generateKey = true;
      };
    };
}
