{ ... }:
final: prev: {
  vlc = prev.vlc.override {
    libbluray = prev.libbluray.override {
      withAACS = true;
      withBDplus = true;
    };
  };
}
