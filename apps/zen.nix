{ config, pkgs, inputs, ... }: {
	home.packages = [ inputs.zen-browser.packages."x86_64-linux".default ];
	# programs.zen-browser = {
	# 	enable = true;
	# 	policies = {
	# 		DisableTelemetry = true;
	# 	};
	# 	# profiles.liyua = {
	# 	# 	extensions = with pkgs; [
	# 	# 		nur.repos.rycee.firefox-addons.ublockorigin
	# 	# 	];
	# 	# };
	# };
}
