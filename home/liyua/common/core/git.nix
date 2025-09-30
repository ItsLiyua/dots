{ config, myLib, ... }:
{
  sops.secrets = {
    "liyua/git" = { };
    "liyua/uni-gitconfig" = { };
  };
  programs = {
    git = {
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
      includes = [
        {
          condition = "gitdir:~/Documents/Uni/";
          path = config.sops.secrets."liyua/uni-gitconfig".path;
        }
      ];
    };
    ssh.matchBlocks = {
      "github.com" = {
        user = "git";
        hostname = "github.com";
        identityFile = config.sops.secrets."liyua/git".path;
      };
      "gitlab.com" = {
        user = "git";
        hostname = "gitlab.com";
        identityFile = config.sops.secrets."liyua/git".path;
      };
    };
    zsh.shellAliases = {
      ga = "git add -A";
      gs = "git status";
      gc = "git commit";
      gca = "git commit -a";
      gcam = "git commit -am";
      gp = "git push";
      gu = "git pull";
    };
  };
  home.file.".ssh/allowed_signers".text = ''
    ${builtins.readFile (myLib.relativeToRoot "keys/id_nfc.pub")}
    ${builtins.readFile (myLib.relativeToRoot "keys/id_nfc-c.pub")}
    ${builtins.readFile (myLib.relativeToRoot "keys/id_nano.pub")}
    liyua@nano.old sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIN0+B3yM7FqDHXq/F99ZAvnM3Vap1u9+g59NXfDk34lQAAAABHNzaDo= liyua@nano
    liyua@nfc.old sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAICdngkr57QIPqK6Lm4235y61BUG9jjU1fJioVZRWb2zIAAAABHNzaDo= liyua@nfc
  '';
}
