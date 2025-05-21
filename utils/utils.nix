{ pkgs, lib, ... }: {
	imports = [
		./zsh.nix
		./btop.nix
		./git.nix
		./ssh.nix
		./fastfetch.nix
    ./clipboard.nix
    ./cava.nix
    ./unfree-whitelist.nix
	];
}

