{ config, pkgs, ... }: {
	environment.sessionVariables = {
		FLAKE = "~/nix";
	};

	environment.systemPackages = [ pkgs.nh ];
}
