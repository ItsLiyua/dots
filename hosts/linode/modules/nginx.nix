{
  services.nginx = {
    enable = true;
    streamConfig = ''
      server {
        listen 25565 reuseport;

        proxy_bind smp.liyua.moe;
        proxy_timeout 20s;
        proxy_pass 10.15.0.3:25565;

        access_log logs/mcj-access.log basic;
        error_log logs/mcj-error.log;
      }
    '';
  };
}
