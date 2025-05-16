{ pkgs, lib, ... }: {
	imports = [
		./btop.nix
		./git.nix
		./ssh.nix
	];
}

