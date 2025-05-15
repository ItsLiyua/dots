{ config, lib, pkgs, home-manager, ... }:
{
	# imports = [ (import "${home-manager}/nixos") ];

	modules = [
		home-manager.nixosModules.home-manager {
			inputs.home-manager.users.root = {
				home.stateVersion = "24.11";
				programs.git = {
					enable = true;
					extraConfig.safe.directory = "/etc/nixos";
				};
			};
		}
	];
}
