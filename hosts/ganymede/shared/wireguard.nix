{ config, ... }:
{
  config = {
    sops.secrets."wireguard/ganymede".owner = "systemd-network";
    liyua.network.wireguard.devices.ganymede = {
      assignedIP = "10.15.0.7";
      privateKeyFile = config.sops.secrets."wireguard/ganymede".path;
      publicKey = "jQZ3FMy96W4Dw7TgglANFlsTNm12qLXDzqnXuMUIQxg=";
    };
  };
}
