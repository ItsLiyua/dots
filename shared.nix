{config, lib, pkgs, ... }: {
	imports = [
		./modules/users.nix
		./modules/doas.nix
		./modules/zsh.nix
		./modules/nh.nix
		./modules/git.nix
		./modules/ssh.nix
		./modules/fonts.nix
		./modules/neovim/neovim.nix
	];
}
