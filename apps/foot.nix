{ config, lib, pkgs, ... }: {
	programs.foot = {
		enable = true;
		settings = {
			main.font = "monospace:size=10";
			main.pad = "5x5";
			scrollback.lines = 10000;
			mouse.hide-when-typing = true;
			colors.background = "000000";
		};
	};
}
