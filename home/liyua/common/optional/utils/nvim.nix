{
  self,
  config,
  lib,
  pkgs,
  ...
}:
{
  options.liyua.programs.nvim = {
    enable = lib.mkEnableOption "Liyua's nvim configuration";
    base16 = lib.mkOption {
      type = lib.types.nullOr (
        lib.types.submodule {
          options =
            lib.genAttrs
              (map (n: "base0${toString n}") [
                0
                1
                2
                3
                4
                5
                6
                7
                8
                9
                "A"
                "B"
                "C"
                "D"
                "E"
                "F"
              ])
              (
                n:
                lib.mkOption {
                  type = lib.types.str;
                  description = "Color ${n}";
                }
              );
        }
      );
      default = null;
    };
  };
  config.home = lib.mkIf config.liyua.programs.nvim.enable {
    packages = [
      (self.packages.${pkgs.stdenv.hostPlatform.system}.nvimBuilder {
        inherit (config.liyua.programs.nvim) base16;
      })
    ];
  };
}
