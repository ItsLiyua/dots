{ config, lib, pkgs, ... }: {
	programs.fastfetch = {
		enable = true;
		settings = {
			logo = {
				source = "nixos_old_small";
				padding.right = 4;
			};
			display = {
				size.binaryPrefix = "si";
				color = {
					keys = "blue";
					title = "red";
				};
				key = {
					width = 10;
					type = "string";
				};
				percent = {
					type = 9;
					color = {
						green = "green";
						yellow = "light_yellow";
						red = "light_red";
					};
				};
				separator = " ";
			};

			modules = [
				"title"
				"os"
				"host"
				"kernel"
				"shell"
				"uptime"
				"packages"
			];
		};
	};
}
