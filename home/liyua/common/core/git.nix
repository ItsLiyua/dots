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
    liyua@nano sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIP8pXb07NpVYuq3VyCnrI7DAZFvq2wDYrUehggKTkUl9AAAABHNzaDo= liyua@nano
    liyua@nfc sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAICdngkr57QIPqK6Lm4235y61BUG9jjU1fJioVZRWb2zIAAAABHNzaDo= liyua@nfc
  '';
}
