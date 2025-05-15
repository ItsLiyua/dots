{
	programs.git = {
		enable = true;
		userName = "Liyua";
		userEmail = "liyua@duck.com";
		lfs.enable = true;
		extraConfig = {
			init.defaultBranch = "master";
			push.autoSetupRemote = true;
		};
	};
}
