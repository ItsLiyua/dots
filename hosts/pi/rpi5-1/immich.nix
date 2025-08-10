{
  services.immich = {
    enable = true;
    database = {
      enable = true;
      createDB = true;
    };
    machine-learning.enable = false;
    accelertionDevices = [ "/dev/dri/renderD128" ];
    openFirewall = true;
  };
}
