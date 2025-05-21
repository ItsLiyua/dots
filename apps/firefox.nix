{ config, lib, pkgs, ... }: {
  stylix.targets.firefox.profileNames = [ "default" ];
	programs.firefox = {
		enable = true;
		profiles.default = {
			id = 0;
			name = "default";
			isDefault = true;
      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        duckduckgo-privacy-essentials
        bitwarden
        enhancer-for-youtube
        return-youtube-dislikes
        istilldontcareaboutcookies
        sponsorblock
        sponsorblock
        clearurls
        firefox-color
      ];
			settings = {
				"browser.startup.homepage" = "https://duckduckgo.com";
        "browser.newtab.url" = "https://duckduckgo.com";
				# "browser.search.defaultenginename" = "DuckDuckGo";
				# "browser.search.order.1" = "DuckDuckGo";
			};
		};
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      PasswordManagerEnabled = false;
      DisableAccounts = true;
      DisableFirefoxScreenshots = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;
    };
	};
}
