{ config, lib, pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		wget
		btop
		unzip
	];
}
