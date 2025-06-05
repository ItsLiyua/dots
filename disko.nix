{
	disko.devices = {
		disk = {
			main = {
				device = "/dev/nvme0n1";
				type = "disk";
				content = {
					type = "gpt";
					partitions = {
						ESP = {
							type = "EF00";
							size = "512M";
							content = {
								type = "filesystem";
								format = "vfat";
								mountpoint = "/boot/firmware";
								mountOptions = [
									"noatime"
									"noauto"
									"x-systemd.automount"
									"x-systemd.idle-timeout=1min"
								];
							};
						};
						root = {
							size = "100%";
							content = {
								type = "filesystem";
								format = "ext4";
								mountpoint = "/";
								mountOptions = [ "noatime" ];
							};
						};
					};
				};
			};
		};
	};
}
