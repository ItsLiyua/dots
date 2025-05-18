{ config, lib, pkgs, ... }: {
	programs.foot = {
		enable = true;
		settings = {
			main.font = "JetBrainsMono Nerd Font:size=11";
			main.pad = "10x10";
			scrollback.lines = 10000;
			mouse.hide-when-typing = true;
			colors.background = "000000";
      scrollback.indicatorPosition = "none";
    };
	};
}
