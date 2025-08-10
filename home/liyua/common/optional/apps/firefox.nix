{
  config,
  lib,
  pkgs,
  nix-userstyles,
  ...
}:
lib.mkIf config.liyua.apps.firefox.enable {
  stylix.targets.firefox = {
    enable = true;
    profileNames = [ "default" ];
    colorTheme.enable = true;
  };
  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;
      extensions = {
        force = true;
        settings = {
          "newtaboverride@agenedia.com" = {
            force = true;
            settings = {
              url = "https://home.liyua.moe";
              focus_website = true;
            };
          };
        };
      };
      userContent = ''
        ${builtins.readFile "${nix-userstyles.packages.${pkgs.system}.mkUserStyles
          (
            config.lib.stylix.colors
            |> lib.getAttrs (
              (lib.range 0 9)
              ++ [
                "A"
                "B"
                "C"
                "D"
                "E"
                "F"
              ]
              |> map (n: "base0${toString n}")
            )
          )
          [
            "github"
            "duckduckgo"
            "nixos-*"
            "npm"
            "reddit"
            "stack-overflow"
            "whatsapp-web"
            "wikipedia"
            "youtube"
          ]
        }"}
      '';
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
          "MyNixOS" = {
            urls = [
              {
                template = "https://mynixos.com/search";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "!mno" ];
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
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
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
      ExtensionSettings =
        let
          latestExtensionSourceURL =
            name: "https://addons.mozilla.org/firefox/downloads/latest/${name}/latest.xpi";
        in
        {
          "uBlock0@raymondhill.net" = {
            default_area = "menupanel";
            install_url = latestExtensionSourceURL "ublock-origin";
            installation_mode = "force_installed";
            private_browsing = true;
          };
          "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
            default_area = "menupanel";
            install_url = latestExtensionSourceURL "bitwarden-password-manager";
            installation_mode = "force_installed";
            private_browsing = true;
          };
          "{74145f27-f039-47ce-a470-a662b129930a}" = {
            install_url = latestExtensionSourceURL "clearurls";
            installation_mode = "force_installed";
            private_browsing = true;
          };
          "addon@simplelogin" = {
            default_area = "menupanel";
            install_url = latestExtensionSourceURL "simplelogin";
            installation_mode = "force_installed";
            private_browsing = true;
          };
          "sponsorBlocker@ajay.app" = {
            default_area = "menupanel";
            install_url = latestExtensionSourceURL "sponsorblock";
            installation_mode = "force_installed";
            private_browsing = false;
          };
          "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
            install_url = latestExtensionSourceURL "return-youtube-dislikes";
            installation_mode = "force_installed";
            private_browsing = false;
          };
          "enhancerforyoutube@maximerf.addons.mozilla.org" = {
            install_url = latestExtensionSourceURL "enhancer-for-youtube";
            installation_mode = "force_installed";
            private_browsing = false;
          };
        };
    };
  };
}
