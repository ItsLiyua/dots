{ config, lib, ... }:
{
  options.liyua.audio.enable = lib.mkEnableOption "Adds pipewire";
  config = lib.mkIf config.liyua.audio.enable {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      audio.enable = true;
      jack.enable = true;
      alsa.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };
}
