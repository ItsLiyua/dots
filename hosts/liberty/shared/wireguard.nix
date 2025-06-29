{
  config,
  ...
}:
{
  config = {
    sops.secrets."wireguard/liberty".owner = "systemd-network";
    liyua.network.wireguard.devices.liberty = {
      server = true;
      assignedIP = "10.15.0.5";
      privateKeyFile = config.sops.secrets."wireguard/liberty".path;
      publicKey = "eKDEMU79zTEKrRn/no7/9McLCK0MG+eibZ8NioYmEis=";
    };
  };
}
