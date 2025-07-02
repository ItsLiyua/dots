{
  services.glance = {
    enable = true;
    openFirewall = true;
    settings = {
      server = {
        host = "0.0.0.0";
        port = 7575;
        proxies = true;
      };
      theme = {
        background-color = "240 21 15";
        contrast-multiplier = 1.2;
        primary-color = "217 92 83";
        positive-color = "115 54 76";
        negative-color = "347 70 65";
      };
      pages = [
        {
          name = "Start";
          columns = [
            {
              size = "small";
              widgets = [
                {
                  type = "clock";
                  hour-format = "24h";
                  timezones = [
                    {
                      timezone = "America/New_York";
                      label = "New York";
                    }
                    {
                      timezone = "Asia/Tokyo";
                      label = "Tokyo";
                    }
                  ];
                }
                {
                  type = "calendar";
                  first-day-of-week = "monday";
                }
                {
                  type = "weather";
                  location = "London, United Kingdom";
                  units = "metric";
                  hour-format = "24h";
                  hide-location = true;
                }
                { type = "to-do"; }
              ];
            }
            {
              size = "full";
              widgets = [
                {
                  type = "search";
                  search-engine = "duckduckgo";
                  new-tab = true;
                  autofocus = true;
                  bangs = [
                    {
                      title = "YouTube";
                      shortcut = "!yt";
                      url = "https://youtube.com/results?search_query={QUERY}";
                    }
                    {
                      title = "Nix Packages";
                      shortcut = "!np";
                      url = "https://search.nixos.org/packages?channel=unstable&sort=relevance&query={QUERY}";
                    }
                  ];
                }
                {
                  type = "split-column";
                  widgets = [
                    {
                      type = "server-stats";
                      server = [ { type = "local"; } ];
                    }
                    {
                      type = "monitor";
                      cache = "1m";
                      title = "Services";
                      sites = [
                        {
                          title = "Dashboard";
                          url = "https://home.liyua.moe";
                          icon = "di:glance";
                        }
                        {
                          title = "Radicale";
                          url = "https://calendar.liyua.moe";
                          icon = "di:radicale";
                          # alt-status-codes = [ 302 ];
                        }
                        {
                          title = "Vaultwarden";
                          url = "https://vault.liyua.moe";
                          icon = "di:vaultwarden";
                        }
                      ];
                    }
                  ];
                }
                {
                  type = "split-column";
                  widgets = [
                    {
                      type = "videos";
                      style = "vertical-list";
                      collapse-after = 5;
                      channels = [
                        "UCXuqSBlHAE6Xw-yeJA0Tunw" # LTT
                        "UCg6gPGh8HU2U01vaFCAsvmQ" # CTT
                        "UCwHwDuNd9lCdA7chyyquDXw" # Bread on Penguins
                        "UCld68syR8Wi-GY_n4CaoJGA" # Brodie Robertson
                        "UCJLZe_NoiG0hT7QCX_9vmqw" # I did a thing
                        "UCl2mFZoRqjw_ELax4Yisf6w" # Louis Rossmann
                        "UCFAiFyGs6oDiF1Nf-rRJpZA" # Technoblade
                        "UC5UAwBUum7CPN5buc-_N1Fw" # The Linux Experiment
                        "UCsnGwSIHyoYN0kiINAGUKxg" # Wolfgans Channel
                        "UC6IxnFzHofFJ5X2PycSMsww" # xkcd
                      ];
                    }
                    {
                      type = "twitch-channels";
                      channels = [
                        "theprimeagen"
                        "j_blow"
                        "piratesoftware"
                        "cohhcarnage"
                        "christitustech"
                        "EJ_SA"
                      ];
                    }
                  ];
                }
              ];
            }
            {
              size = "small";
              widgets = [
                {
                  type = "bookmarks";
                  groups = [
                    {
                      links = [
                        {
                          title = "ProtonMail";
                          url = "https://mail.proton.me";
                        }
                        {
                          title = "GitHub";
                          url = "https://github.com";
                        }
                        {
                          title = "Wikipedia";
                          url = "https://en.wikipedia.org";
                        }
                        {
                          title = "Reddit";
                          url = "https://reddit.com";
                        }
                        {
                          title = "YouTube";
                          url = "https://youtube.com";
                        }
                      ];
                    }
                    {
                      title = "Nix";
                      color = "267 84 81";
                      links = [
                        {
                          title = "nixpkgs";
                          url = "https://search.nixos.org";
                        }
                        {
                          title = "MyNixOS";
                          url = "https://mynixos.com";
                        }
                      ];
                    }
                    {
                      title = "Entertainment";
                      color = "343.27 81.25 74.9";
                      links = [
                        {
                          title = "Disney+";
                          url = "https://disneyplus.com";
                        }
                        {
                          title = "Netflix";
                          url = "https://netflix.com";
                        }
                        {
                          title = "Amazon Video";
                          url = "https://amazon.com/gp/video/storefront";
                        }
                        {
                          title = "Crunchyroll";
                          url = "https://crunchyroll.com";
                        }
                      ];
                    }
                    {
                      title = "Modding";
                      color = "115 54 76";
                      links = [
                        {
                          title = "Modrinth";
                          url = "https://modrinth.com";
                        }
                        {
                          title = "CurseForge";
                          url = "https:///curseforge.com";
                        }
                        {
                          title = "NexusMods";
                          url = "https://nexusmods.com";
                        }
                      ];
                    }
                  ];
                }
                {
                  type = "releases";
                  cache = "1d";
                  repositories = [
                    "glanceapp/glance"
                    "Kozea/Radicale"
                    "dani-garcia/vaultwarden"
                    "lunik1/nix-wallpaper"
                    "YaLTeR/niri"
                    "hyprwm/Hyprland"
                  ];
                }
              ];
            }
          ];
        }
      ];
    };
  };
}
