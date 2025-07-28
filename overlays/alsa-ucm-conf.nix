final: prev: {
  alsa-ucm-conf = prev.alsa-ucm-conf.overrideAttrs {
    version = "1.12.14";
    src = prev.fetchurl {
      url = "https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.14.tar.bz2";
      hash = null;
    };
  };
}
