{ config, lib, pkgs, ... }: {
	boot.loader = {
		systemd-boot.enable = false;
		efi.canTouchEfiVariables = true;
		grub = {
			enable = true;
			device = "nodev";
			efiSupport = true;
		};
	};
}
