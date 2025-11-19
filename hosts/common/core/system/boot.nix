{
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      timeout = 3;
      systemd-boot = {
        enable = true;
        memtest86.enable = true;
        configurationLimit = 20;
      };
    };
    consoleLogLevel = 3;
    initrd.systemd.enable = true;
  };
}
