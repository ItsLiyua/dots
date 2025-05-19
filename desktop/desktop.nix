{ pkgs, lib, inputs, ... }: {
	imports = [
		./hyprland.nix
    ./lockscreen.nix
    ./theme.nix
    ./ags/ags.nix
	];
}

