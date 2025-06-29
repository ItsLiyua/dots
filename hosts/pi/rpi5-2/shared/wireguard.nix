{
  config,
  ...
}:
{
  config = {
    sops.secrets."wireguard/rpi5-2".owner = "systemd-network";
    liyua.network.wireguard.devices.linode = {
      server = true;
      assignedIP = "10.15.0.4";
      privateKeyFile = config.sops.secrets."wireguard/rpi5-2".path;
      publicKey = "UQ8STKuIHeKLHJE1Zv44Ms1LVshGITvCggtGXP6TBCw=";
    };
  };
}
