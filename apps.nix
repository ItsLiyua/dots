{ pkgs, lib, inputs, ... } : {
	imports = [
		./apps/firefox.nix
		./apps/discord.nix
	];
}
