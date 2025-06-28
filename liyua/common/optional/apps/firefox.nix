{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.liyua.apps.firefox.enable {
    stylix.targets.firefox.profileNames = [ "default" ];
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
          ];
          settings = {
          };
        };
        search = {
          force = true;
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
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "!np" ];
            };
          };
        };
      };
      policies = {
      };
    };
  };
}
