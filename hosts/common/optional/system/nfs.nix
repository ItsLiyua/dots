{ config, lib, ... }:
{
  options.liyua.nfs = {
    enable = lib.mkEnableOption "NFS mounting";
    drives = {
      music.enable = lib.mkEnableOption "Music Share";
      anime.enable = lib.mkEnableOption "Anime Share";
      movies.enable = lib.mkEnableOption "Movie Share";
    };
  };
  config =
    let
      cfg = config.liyua.nfs;
    in
    lib.mkIf cfg.enable {
      boot.supportedFilesystems = [ "nfs" ];
      fileSystems =
        let
          mountOpts = {
            fsType = "nfs";
            options = [
              "nfsvers=4.2"
              "x-systemd.automount"
              "noauto"
              "x-systemd.idle-timeout=600"
            ];
          };
        in
        {
          "/mnt/nfs/anime" = lib.mkIf cfg.drives.anime.enable (
            mountOpts // { device = "ganymede.local:/export/anime"; }
          );
          "/mnt/nfs/movies" = lib.mkIf cfg.drives.movies.enable (
            mountOpts // { device = "ganymede.local:/export/movies"; }
          );
          "/mnt/nfs/music" = lib.mkIf cfg.drives.music.enable (
            mountOpts // { device = "ganymede.local:/export/music"; }
          );
        };
    };
}
