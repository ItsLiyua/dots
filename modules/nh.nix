{ config, pkgs, ... }: {
	environment.sessionVariables = {
		FLAKE = "/etc/nixos";
	};

	environment.systemPackages = [ pkgs.nh ];
}
