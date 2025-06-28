{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.liyua.apps.firefox.enable {
    stylix.targets.firefox = {
      enable = true;
      profileNames = [ "default" ];
    };
    programs.firefox = {
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
            clearurls
            new-tab-override
          ];
          settings = {
            "newtaboverride@agenedia.com" = {
              force = true;
              settings = {
                url = "https://home.liyua.moe";
                focusWebsite = true;
              };
            };
          };
        };
        search = {
          force = true;
          default = "ddg";
          engines = {
            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "type";
                      value = "packages";
                    }
                    {
                      name = "sort";
                      value = "relevance";
                    }
                    {
                      name = "channel";
                      value = "unstable";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "!np" ];
            };
          };
        };
        settings = {
          "browser.startup.homepage" = "https://home.liyua.moe";
          "browser.newtab.url" = "https://home.liyua.moe";
          "browser.aboutconfig.showWarning" = false;
          "browser.bookmarks.addImportButton" = false;
          "browser.uiCustomization.state" =
            ''{"placements":{"widget-overflow-fixed-list":[],"unified-extensions-area":["sponsorblocker_ajay_app-browser-action","newtaboverride_agenedia_com-browser-action","_74145f27-f039-47ce-a470-a662b129930a_-browser-action","_762f9885-5a13-4abd-9c77-433dcd38b8fd_-browser-action","enhancerforyoutube_maximerf_addons_mozilla_org-browser-action","firefoxcolor_mozilla_com-browser-action","idcac-pub_guus_ninja-browser-action"],"nav-bar":["back-button","forward-button","stop-reload-button","customizableui-special-spring1","vertical-spacer","urlbar-container","customizableui-special-spring2","save-to-pocket-button","downloads-button","fxa-toolbar-menu-button","unified-extensions-button","ublock0_raymondhill_net-browser-action","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","jid1-zadieub7xozojw_jetpack-browser-action"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button","alltabs-button"],"vertical-tabs":[],"PersonalToolbar":["personal-bookmarks"]},"seen":["developer-button","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","_74145f27-f039-47ce-a470-a662b129930a_-browser-action","_762f9885-5a13-4abd-9c77-433dcd38b8fd_-browser-action","enhancerforyoutube_maximerf_addons_mozilla_org-browser-action","firefoxcolor_mozilla_com-browser-action","idcac-pub_guus_ninja-browser-action","jid1-zadieub7xozojw_jetpack-browser-action","newtaboverride_agenedia_com-browser-action","sponsorblocker_ajay_app-browser-action","ublock0_raymondhill_net-browser-action"],"dirtyAreaCache":["nav-bar","vertical-tabs","PersonalToolbar","unified-extensions-area","TabsToolbar"],"currentVersion":22,"newElementCount":3}'';
          "extensions.pocket.enabled" = false;
        };
      };
      policies = {
        DisableAccounts = true;
        DisableFirefoxAccounts = true;
        Authentication = false;
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;
        Cookies = false;
        DisableFeedbackCommands = true;
        DisableFirefoxScreenshots = true;
        DisableFirefoxStudies = true;
        DisableMasterPasswordCreation = true;
        DisablePasswordReveal = true;
        DisableTelemetry = true;
        DisplayBookmarksToolbar = "always";
        OfferToSaveLogins = false;
        PasswordManagerEnabled = false;
      };
    };
  };
}
