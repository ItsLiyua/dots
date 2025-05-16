{ config, lib, pkgs, ... }: {
	programs.nano.enable = false;
	programs.neovim = {
		enable = true;
		defaultEditor = true;
	};
}
