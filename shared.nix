{ config, lib, pkgs, ... }: {
	boot.initrd.systemd.dbus.enable = true;
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
	];
}
