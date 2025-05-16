{ config, pkgs, ... }: {
	# environment.sessionVariables.NH_FLAKE = "/etc/nixos";
	# environment.systemPackages = [ pkgs.nh ];
	programs.nh = {
		enable = true;
		clean.enable = false;
		flake = "/etc/nixos";
	};
}
