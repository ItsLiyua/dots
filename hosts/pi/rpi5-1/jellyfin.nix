{
  users.users.jellyfin.extraGroups = [ "video" ];
  hardware.raspberry-pi.config.all.options.gpu_mem = {
    enable = true;
    value = "2048";
  };
  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };
}
