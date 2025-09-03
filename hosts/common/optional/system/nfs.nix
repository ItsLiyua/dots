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
          "/mnt/nfs/anime" = lib.mkIf cfg.drives.anime.enable (
            mountOpts // { device = "rpi5-1.local:/export/anime"; }
          );
          "/mnt/nfs/movies" = lib.mkIf cfg.drives.movies.enable (
            mountOpts // { device = "rpi5-1.local:/export/anime"; }
          );
          "/mnt/nfs/music" = lib.mkIf cfg.drives.music.enable (
            mountOpts // { device = "rpi5-1.local:/export/anime"; }
          );
        };
    };
}
