{ config, ... }:
{
  programs.git = {
    enable = true;
    userName = "Liyua";
    userEmail = "liyua@liyua.moe";
    lfs.enable = true;
    extraConfig = {
      init.defaultBranch = "master";
      push.autoSetupRemote = true;
      pull.rebase = false;
      commit.gpgsign = true;
      tag.gpgsign = true;
      gpg.format = "ssh";
      gpg.ssh.allowedsignersfile = "${config.home.homeDirectory}/.ssh/allowed_signers";
      user.signingkey = "${config.home.homeDirectory}/.ssh/id_yubikey";
    };
  };
  home.file.".ssh/allowed_signers".text = ''
    liyua@nano sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIM6+1cR0P5EjO26/+LzJODBxOJzR9I3m0tNM6c5J/OYVAAAABHNzaDo= liyua@nano
    liyua@nfc sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIL7rfMuc1NerL/NTnkABcwIuZNSlUz9AnowvIUDT6LN4AAAABHNzaDo= liyua@nfc
    liyua@nano.old sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIN0+B3yM7FqDHXq/F99ZAvnM3Vap1u9+g59NXfDk34lQAAAABHNzaDo= liyua@nano
    liyua@nfc.old sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAICdngkr57QIPqK6Lm4235y61BUG9jjU1fJioVZRWb2zIAAAABHNzaDo= liyua@nfc
  '';
}
