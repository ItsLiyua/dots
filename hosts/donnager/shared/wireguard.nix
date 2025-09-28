{
  config,
  myLib,
  ...
}:
{
  config = {
    sops.secrets."wireguard-donnager" = {
      owner = "systemd-network";
      sopsFile = myLib.sopsFileSystem;
    };
    liyua.network.wireguard.devices.donnager = {
      assignedIP = "10.15.0.2";
      privateKeyFile = config.sops.secrets."wireguard-donnager".path;
      publicKey = "PCFtL6M/vfrxFFVSXAi7ascCUFBrM9i8PhLLuTUDeyA=";
    };
  };
}
