{ config, lib, pkgs, ... }: {
	users.users.liyua = {
		isNormalUser = true;
		useDefaultShell = true;
		extraGroups = [
			"wheel"
			"networkmanager"
			"audio"
			"video"
			"input"
			"power"
		];
		openssh.authorizedKeys.keys = [
			"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHKZZyrwb0depJAXqeoN8+q8kquwgAHz3uRssneGDtp0 liyua@liberty"
		];
	};
}

