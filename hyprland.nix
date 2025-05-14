{
	wayland.windowManager.hyprland = {
		enable = true;

		settings = {
			"$mod" = "SUPER";
			general = {
				border_size = 4;
				gaps_in = 5;
				gaps_out = 10;
			};
			input = {
				kb_layout = "de";
			};
			bind = [
				"$mod, Q, killactive"
				"$mod, T, exec, foot"
				"$mod, F, exec, zen"
				"$mod, A, exec, wofi"
			];
			debug = {
				disable_logs = false;
			};
		};
	};
}
