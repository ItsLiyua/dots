{ config, pkgs, ... }: {
	# config.home.packages = config.home.packages ++ [ pkgs.vesktop ];
	config.home.packages = [ pkgs.vesktop ];
}
