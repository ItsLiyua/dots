{
  users.users.jellyfin.extraGroups = [ "video" ];
  hardware.raspberry-pi.config.all.gpu_mem = "2048";
  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };
}
