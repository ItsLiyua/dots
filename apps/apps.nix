{ pkgs, lib, inputs, ... } : {
	imports = [
		./foot.nix
		./firefox.nix
		./discord.nix
    ./prismlauncher.nix
	];
}
