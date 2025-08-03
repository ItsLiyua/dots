final: prev: {
  steam = prev.steam.overrideAttrs {
    multiPkgs =
      pkgs:
      (with pkgs; [
        glibc
        libxcrypt
        libGL
        libdrm
        libgbm
        udev
        libudev0-shim
        libva
        vulkan-loader
        libcap
      ]);
  };
}
