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
        background-color = " 240 21 15";
        contrast-multiplier = " 1.2";
        primary-color = " 217 92 83";
        positive-color = " 115 54 76";
        negative-color = " 347 70 65";
      };
      pages = [
        {
          name = "Start";
          columns = [
            {
              size = "small";
              widgets = [
                {
                  type = "calendar";
                  first-day-of-week = "monday";
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
            {
              size = "full";
              widgets = [
              ];
            }
            {
              size = "small";
              widgets = [
                {
                  type = "weather";
                  location = "London, United Kingdom";
                  units = "metric";
                  hour-format = "24h";
                  hide-location = true;
                }
                {
                  type = "releases";
                  cache = "1d";
                  repositories = [
                    "glanceapp/glance"
                    "go-gitea/gitea"
                    "immich-app/immich"
                    "syncthing/syncthing"
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
