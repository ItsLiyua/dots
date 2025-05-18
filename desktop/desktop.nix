{ pkgs, lib, inputs, ... }: {
	imports = [
		./hyprland.nix
    ./cursor.nix
    ./ags/ags.nix
	];
}

