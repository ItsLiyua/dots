{ config, pkgs, ... }: {
	environment.sessionVariables = {
		NH_OS_FLAKE = "/etc/nixos";
		NH_HOME_FLAKE = ".config/home-manager";
	};
	# environment.systemPackages = [ pkgs.nh ];
	programs.nh = {
		enable = true;
		clean.enable = false;
	};
}
