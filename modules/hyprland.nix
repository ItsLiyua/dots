{ config, lib, pkgs, ... }: {
	programs.hyprland = {
		enable = true;
		withUWSM = true;
		xwayland.enable = true;
	};
}
