{
  security = {
    sudo.enable = false;
    doas = {
      enable = true;
      extraRules = [
        {
          groups = [ "wheel" ];
          keepEnv = true;
          persist = true;
        }
        {
          groups = [ "power" ];
          cmd = "shutdown";
          runAs = "root";
          noPass = true;
        }
        {
          groups = [ "power" ];
          cmd = "reboot";
          runAs = "root";
          noPass = true;
        }
      ];
    };
  };
}
