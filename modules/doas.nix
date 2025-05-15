{ config, ... }: {
  config.users.groups.power.gid = 1000;
  config.security.sudo.enable = false;
  config.security.doas = {
    enable = true;
    extraRules = [
      {
	groups = [ "wheel" ];
	keepEnv = true;
	# persist = true;
      }
      {
	groups = [ "power" ];
        cmd = "shutdown";
	runAs = "root";
	noPass = true;
      }
    ];
  };
}
