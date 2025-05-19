{ pkgs, lib, inputs, ... }: {
	imports = [
		./hyprland.nix
    ./theme.nix
    ./ags/ags.nix
	];
}

