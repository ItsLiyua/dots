{ config, pkgs, ... }: {
	config.home.sessionVariables = {
		GDK_SCALE = 1;
	};
	config.home.packages = [ pkgs.vesktop ];
}
