{
  config,
  myLib,
  ...
}:
{
  sops.secrets."wireguard" = {
    owner = "systemd-network";
    sopsFile = myLib.sopsFileSystem;
  };
  liyua.network.wireguard = {
    endpoint = "liyua.moe:${toString config.liyua.network.wireguard.port}";
    port = 51820;
    keepAliveInterval = 25;
    netMaskBits = 24;
    privateKeyFile = config.sops.secrets."wireguard".path;
    devices.linode = {
      server = true;
      assignedIP = "10.15.0.1";
      publicKey = "cOa8ACs07xdE+C7H3O/+2tA7BKfIIHaojz80WZbazlM=";
    };
  };
}
