{ lib }:
final: prev: {
  alsa-ucm-conf = prev.alsa-ucm-conf.overrideAttrs rec {
    version = "1.2.14";
    src = final.fetchurl {
      url = "https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-${version}.tar.bz2";
      hash = "sha256-MumAn1ktkrl4qhAy41KTwzuNDx7Edfk3Aiw+6aMGnCE=";
    };

    installPhase = ''
      runHook preInstall

      substituteInPlace ucm2/lib/card-init.conf \
        --replace-fail "/bin/rm" "${final.pkgs.coreutils}/bin/rm" \
        --replace-fail "/bin/mkdir" "${final.pkgs.coreutils}/bin/mkdir"

      files=(
        # "ucm2/HDA/HDA.conf"
        # "ucm2/codecs/rt715/init.conf"
        # "ucm2/codecs/rt715-sdca/init.conf"
        # "ucm2/Intel/cht-bsw-rt5672/cht-bsw-rt5672.conf"
        # "ucm2/Intel/bytcr-rt5640/bytcr-rt5640.conf"
      )
    ''
    + lib.optionalString final.pkgs.stdenv.hostPlatform.isLinux ''
      for file in "''${files[@]}"; do
        substituteInPlace "$file" \
          --replace-fail '/sbin/modprobe' '${final.pkgs.kmod}/bin/modprobe'
      done
    ''
    + ''
      mkdir -p $out/share/alsa
      cp -r ucm ucm2 $out/share/alsa

      runHook postInstall
    '';
  };
}
