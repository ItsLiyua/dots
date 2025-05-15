{ programs, ... }: {
	programs.btop = {
		enable = true;
		settings = {
			color_theme = "HotPurpleTrafficLight";
			theme_background = false;
		};
	};
}
