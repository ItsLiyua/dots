{config, lib, pkgs, ... }:
{
	programs.git = {
		enable = true;
		config = {
			init.defaultBranch = "master";
			url."https://github.com/".insteadOf = [ "gh:" "github:" ];
			safe.directory = "/home/liyua/nix";
		};
	};
}
