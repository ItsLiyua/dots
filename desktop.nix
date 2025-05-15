{ pkgs, lib, inputs, ... }: {
	# extraSpecialArgs = {
	# 	inherit inputs;
	# };
	imports = [
		./desktop/hyprland.nix
	];
}

