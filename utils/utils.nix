{ pkgs, lib, ... }: {
	imports = [
		./zsh.nix
		./btop.nix
		./git.nix
		./ssh.nix
	];
}

