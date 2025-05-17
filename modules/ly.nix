{ config, lib, pkgs, ... }: {
	services.displayManager.ly = {
		enable = true;
		settings = {
			allow_empty_passwords = false;
			animation = "cmatrix";
			animation_timeout_sec = 600;
			asterisk = "*";
			auth_fails = 3;
			bigclock = "en";
			box_title = "Login";
			clear_password = true;
			load = true;
			save = true;
			vi_mode = true;
		};
	};
}
