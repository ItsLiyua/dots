{
  sops.secrets."wireguard".owner = "systemd-network";
  liyua.network.wireguard.devices.liberty = {
    assignedIP = "10.15.0.5";
    publicKey = "eKDEMU79zTEKrRn/no7/9McLCK0MG+eibZ8NioYmEis=";
  };
}
