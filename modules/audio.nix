{ config, lib, pkgs, ... }: {
  security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
    audio.enable = true;
    jack.enable = true;
    alsa.enable = true;
		pulse.enable = true;
    wireplumber.enable = true;
	};
}
