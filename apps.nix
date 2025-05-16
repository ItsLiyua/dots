{ pkgs, lib, inputs, ... } : {
	imports = [
		./apps/foot.nix
		./apps/firefox.nix
		./apps/discord.nix
	];
}
