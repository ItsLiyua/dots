{
  services.prometheus = {
    enable = true;
    port = 9090;
    openFirewall = true;
    globalConfig.scrape_interval = "30s";
    scrapeConfigs = [
      {
        job_name = "prometheus";
        static_configs = [
          {
            targets = [ "localhost:9090" ];
          }
        ];
      }
      {
        job_name = "demo";
        static_configs = [
          {
            targets = [
              "demo.promlabs.com:10000"
              "demo.promlabs.com:10001"
              "demo.promlabs.com:10002"
            ];
          }
        ];
      }
    ];
  };
}
