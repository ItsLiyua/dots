{ config, lib, ... }:
lib.mkIf config.liyua.mpd.enable {
  services.mpd = {
    enable = true;
    musicDirectory = "${config.xdg.userDirs.music}/music";
    playlistDirectory = "${config.xdg.userDirs.music}/playlists";
    network.listenAddress = "127.0.0.1";
    extraConfig = ''
      auto_update "yes"
      restore_paused "yes"
      audio_output {
        type  "pipewire"
        name  "PipeWire Sound Server"
      }
    '';
  };
  programs.inori.enable = true;
}
