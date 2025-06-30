{
  config,
  ...
}:
{
  config = {
    sops.secrets."wireguard/resolute".owner = "systemd-network";
    liyua.network.wireguard.devices.resolute = {
      assignedIP = "10.15.0.4";
      privateKeyFile = config.sops.secrets."wireguard/resolute".path;
      publicKey = "PCFtL6M/vfrxFFVSXAi7ascCUFBrM9i8PhLLuTUDeyA=";
    };
  };
}
