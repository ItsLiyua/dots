{
  config,
  ...
}:
{
  config = {
    sops.secrets."wireguard/t480".owner = "systemd-network";
    liyua.network.wireguard.devices.t480 = {
      server = true;
      assignedIP = "10.15.0.6";
      privateKeyFile = config.sops.secrets."wireguard/t480".path;
      publicKey = "kzFxgoZWg1c37BKtXyo441sYaUtJiQlHyXgs5vygnX8=";
    };
  };
}
