{
  config,
  ...
}:
{
  config = {
    sops.secrets."wireguard/rpi5-1".owner = "systemd-network";
    liyua.network.wireguard.devices.rpi5-1 = {
      assignedIP = "10.15.0.3";
      privateKeyFile = config.sops.secrets."wireguard/rpi5-1".path;
      publicKey = "xF4JZGpbqSziuR82BRIBtYSyL0/MVqE58dgcK/mTcF8=";
    };
  };
}
