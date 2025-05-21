{ config, lib, pkgs, ... }: {
  stylix.targets.firefox.profileNames = [ "default" ];
	programs.firefox = {
		# enable = false;
    enable = true;
		profiles.default = {
			id = 0;
			name = "default";
			isDefault = true;
      extensions = {
        force = true;
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          duckduckgo-privacy-essentials
          bitwarden
          enhancer-for-youtube
          return-youtube-dislikes
          istilldontcareaboutcookies
          sponsorblock
          sponsorblock
          clearurls
          new-tab-override
        ];
        settings = {
          "newtaboverride@agenedia.com" = {
            force = true;
            settings.url = "https://duckduckgo.com";
          };
        };
      };
      settings = let
        lock-false = { Value = false; Status = "locked"; };
        lock-true = { Value = true; Status = "locked"; };
      in {
        "extensions.pocket.enabled" = lock-false;
        "extensions.screenshotd.enabled" = lock-false;
        "browser.formfill.enable" = lock-false;
        "browser.search.suggest.enabled" = lock-false;
        "browser.search.suggest.enabled.private" = lock-false;
        "browser.urlbar.suggest.searches" = lock-false;
        "browser.urlbar.showSearchSuggestionsFirst" = lock-false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
        "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
        "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lock-false;
        "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lock-false;
        "browser.newtabpage.activity-stream.section.highlights.includeVisited" = lock-false;
        "browser.newtabpage.activity-stream.showSponsored" = lock-false;
        "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
        "browser.uiCustomization.state" = ''
          {
            "placements": {
              "widget-overflow-fixed-list": [],
              "unified-extensions-area": [
                "newtaboverride_agenedia_com-browser-action",
                "sponsorblocker_ajay_app-browser-action",
                "firefoxcolor_mozilla_com-browser-action",
                "_74145f27-f039-47ce-a470-a662b129930a_-browser-action",
                "_762f9885-5a13-4abd-9c77-433dcd38b8fd_-browser-action",
                "idcac-pub_guus_ninja-browser-action",
                "enhancerforyoutube_maximerf_addons_mozilla_org-browser-action"
              ],
              "nav-bar": [
                "back-button",
                "forward-button",
                "stop-reload-button",
                "customizableui-special-spring1",
                "vertical-spacer",
                "urlbar-container",
                "customizableui-special-spring2",
                "save-to-pocket-button",
                "downloads-button",
                "fxa-toolbar-menu-button",
                "unified-extensions-button",
                "ublock0_raymondhill_net-browser-action",
                "_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action",
                "jid1-zadieub7xozojw_jetpack-browser-action"
              ],
              "toolbar-menubar": [
                "menubar-items"
              ],
              "TabsToolbar": [
                "tabbrowser-tabs",
                "new-tab-button"
              ],
              "vertical-tabs": [],
              "PersonalToolbar": [
                "import-button",
                "personal-bookmarks"
              ]
            },
            "seen": [
              "developer-button",
              "firefoxcolor_mozilla_com-browser-action",
              "ublock0_raymondhill_net-browser-action",
              "_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action",
              "_74145f27-f039-47ce-a470-a662b129930a_-browser-action",
              "_762f9885-5a13-4abd-9c77-433dcd38b8fd_-browser-action",
              "idcac-pub_guus_ninja-browser-action",
              "enhancerforyoutube_maximerf_addons_mozilla_org-browser-action",
              "jid1-zadieub7xozojw_jetpack-browser-action",
              "sponsorblocker_ajay_app-browser-action",
              "save-to-pocket-button",
              "newtaboverride_agenedia_com-browser-action"
            ],
            "dirtyAreaCache": [
              "nav-bar",
              "vertical-tabs",
              "PersonalToolbar",
              "unified-extensions-area",
              "toolbar-menubar",
              "TabsToolbar"
            ],
            "currentVersion": 22,
            "newElementCount": 2
          }
        '';
        "browser.aboutConfig.showWarning" = lock-false;
        "browser.newtab.extensionControlled" = lock-true;
        "browser.newtab.url" = "https://duckduckgo.com";
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
