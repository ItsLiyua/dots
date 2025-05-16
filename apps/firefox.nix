{ config, lib, pkgs, inputs, ... }: {
	programs.firefox = {
		enable = true;
		profiles.default = {
			id = 0;
			name = "default";
			isDefault = true;
			settings = {
				"browser.startup.homepage" = "https://duckduckgo.com";
				"browser.search.defaultenginename" = "DuckDuckGo";
				"browser.search.order.1" = "DuckDuckGo";
			};
			search = {
				force = true;
				default = "ddg";
				order = [ "ddg" ];
				engines = {
					"Nix Packages" = {
						urls = [{
							template = "https://search.nixos.org/packages";
							params = [
								{ name = "type"; value = "packages"; }
								{ name = "query"; value = "{searchTerms}"; }
							];
						}];
						icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
						definedAliases = [ "@np" ];
					};
					"NixOS Wiki" = {
						urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
						icon = "https://nixos.wiki/favicon.png";
						updateInterval = 24 * 60 * 60 * 1000; # every day
						definedAliases = [ "@nw" ];
					};
					"ddg" = {
						urls = [{
							template = "https://duckduckgo.com";
							params = [{ name = "q"; value = "{searchTerms}"; }];
						}];
						icon = "https://duckduckgo.com/favicon.ico";
						updateInterval = 24 * 60 * 60 * 1000;
						definedAliases = [ "@ddg" ];
					};
					"bing".metaData.hidden = true;
					"google".metaData.hidden = true;
					"ecosia".metaData.hidden = true;
				};
			};
		};
		policies = {
			DisableTelemetry = true;
			DisableFirefoxStudies = true;
			EnableTrackingProtection = {
				Value = true;
				Locked = true;
				Cryptomining = true;
				Fingerprinting = true;
			};
			DisablePocket = true;
			DisableFirefoxAccounts = true;
			DisableAccounts = true;
			DisableFirefoxScreenshots = true;
			# OverrideFirstRunPage = "";
			# OverridePostUpdatePage = "";
			DontCheckDefaultBrowser = true;
			DisplayBookmarksToolbar = "always";
			DisplayMenuBar = "default-off";
			SearchBar = "unified";
			ExtensionSettings = {
				# "*".installation_mode = "blocked";
				"uBlock0@raymondhill.net" = {
					install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
					installation_mode = "force_installed";
				};
				# Bitwarden
				"{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
					install_url = "https://addons.mozilla.org/firefox/downloads/file/4484791/bitwarden_password_manager-2025.4.0.xpi";
					installation_mode = "force_installed";
				};
				# SponsorBlock
				"sponsorBlocker@ajay.app" = {
					install_url = "https://addons.mozilla.org/firefox/downloads/file/4480833/sponsorblock-5.12.1.xpi";
					installation_mode = "force_installed";
				};
				# DDG Privacy Essentials
				"jid1-ZAdIEUB7XOzOJw@jetpack" = {
					install_url = "https://addons.mozilla.org/firefox/downloads/file/4470003/duckduckgo_for_firefox-2025.4.7.xpi";
					installation_mode = "force_installed";
				};
				# Enhancer For Youtube
				"enhancerforyoutube@maximerf.addons.mozilla.org" = {
					install_url = "https://addons.mozilla.org/firefox/downloads/file/4393561/enhancer_for_youtube-2.0.130.1.xpi";
					installation_mode = "force_installed";
				};
				# Return YT Dislike
				"{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
					install_url = "https://addons.mozilla.org/firefox/downloads/file/4371820/return_youtube_dislikes-3.0.0.18.xpi";
					installation_mode = "force_installed";
				};
				# Clear URLs
				"{74145f27-f039-47ce-a470-a662b129930a}" = {
					install_url = "https://addons.mozilla.org/firefox/downloads/file/4432106/clearurls-1.27.3.xpi";
					installation_mode = "force_installed";
				};
			};
		};
	};
}
