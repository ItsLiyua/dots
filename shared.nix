{lib, ...}: {
  imports = [
    ./modules/nix.nix
    ./modules/grub.nix
    ./modules/users.nix
    ./modules/doas.nix
    ./modules/ssh.nix

    ./modules/greeter.nix
    ./modules/zsh.nix
    ./modules/nh.nix
    ./modules/git.nix
    ./modules/fonts.nix
    ./modules/neovim.nix
    ./modules/locale.nix
    ./modules/audio.nix
    ./modules/input.nix
    ./modules/network.nix
    ./modules/extras.nix
    ./modules/logind.nix
    ./modules/ozone.nix
    ./modules/gaming.nix
  ];
  config.liyua = {
    audio.enable = lib.mkDefault true;
    doas.enable = lib.mkDefault true;
    extras.dconf.enable = lib.mkDefault true;
    fonts.enable = lib.mkDefault true;
    gaming.enable = lib.mkDefault true;
    git.enable = lib.mkDefault true;
    greeter.enable = lib.mkDefault true;
    libinput.enable = lib.mkDefault true;
    logind.enable = lib.mkDefault true;
    neovim.enable = lib.mkDefault true;
    networkmanager.enable = lib.mkDefault true;
    nh.enable = lib.mkDefault true;
    waylandNativeOzone.enable = lib.mkDefault true;
    ssh.enable = true;
    userAccount.enable = true;
    zsh.enable = true;
  };
}
