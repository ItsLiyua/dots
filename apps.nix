{ pkgs, lib, ... }: {
	# extraSpecialArgs = { 
	# 	inherit pkgs;
	# 	inherit home;
	# };
	imports = [
		./apps/discord.nix
	];
}
