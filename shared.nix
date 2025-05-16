{config, lib, pkgs, ... }: {
	imports = [
		./modules/users.nix
		./modules/doas.nix
		./modules/nh.nix
		./modules/git.nix
		./modules/ssh.nix
		./modules/neovim/neovim.nix
	];
}
