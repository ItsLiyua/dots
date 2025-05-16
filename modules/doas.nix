{ config, lib, pkgs, ... }: {
  users.groups.power.gid = 1000;
  security.sudo.enable = false;
  security.doas = {
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
  environment.systemPackages = [ (pkgs.writeShellScriptBin "sudo" ''exec doas "$@"'') ];
}
