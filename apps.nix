{ pkgs, lib, inputs, ... } : {
	imports = [
		./apps/zen.nix
		./apps/discord.nix
	];
}
