{ config, lib, pkgs, home, ... }: {
	programs.ssh = {
		enable = true;
		matchBlocks = {
			"github.com" = {
				hostname = "github.com";
				user = "git";
				identityFile = "~/.ssh/id_ed25519";
			};
			"liberty" = {
				hostname = "liberty";
				user = "liyua";
				identityFile = "~/.ssh/id_ed25519";
			};
			"resolute" = {
				hostname = "resolute";
				user = "liyua";
				identityFile = "~/.ssh/id_ed25519";
			};
		};
	};
}
