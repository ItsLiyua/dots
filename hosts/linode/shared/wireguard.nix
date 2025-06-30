{
  config,
  ...
}:
{
  config = {
    sops.secrets."wireguard/linode".owner = "systemd-network";
    liyua.network.wireguard = {
      endpoint = "liyua.moe:51820";
      port = 51820;
      keepAliveInterval = 25;
      netMaskBits = 24;
      devices.linode = {
        server = true;
        assignedIP = "10.15.0.1";
        privateKeyFile = config.sops.secrets."wireguard/linode".path;
        publicKey = "cOa8ACs07xdE+C7H3O/+2tA7BKfIIHaojz80WZbazlM=";
      };
    };
  };
}
