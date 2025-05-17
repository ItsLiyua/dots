{ config, lib, pkgs, ... }: {
	services.greetd = {
		enable = true;
		settings = {
			default_session = {
				command = "${pkgs.greetd.tuigreet}/bin/tuigreet -tr --asterisks --asterisks-char \"*\" --cmd Hyprland";
				user = "greeter";
			};
		};
	};
}
