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
  config = lib.mkIf config.liyua.nfs.enable {
    fileSystems =
      let
        mountOpts = {
          fsType = "nfs";
          options = [
            "nfsvers=4.2"
            "nofail"
          ];
        };
      in
      {
        "/mnt/nfs/anime" = lib.mkIf config.liyua.nfs.drives.anime.enable mountOpts // {
          device = "rpi5-1.local:/export/anime";
        };
        "/mnt/nfs/movies" = lib.mkIf config.liyua.nfs.drives.movies.enable mountOpts // {
          device = "rpi5-1.local:/export/anime";
        };
        "/mnt/nfs/music" = lib.mkIf config.liyua.nfs.drives.music.enable mountOpts // {
          device = "rpi5-1.local:/export/anime";
        };
      };
  };
}
