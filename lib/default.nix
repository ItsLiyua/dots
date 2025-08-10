{ lib, ... }:
rec {
  relativeToRoot = lib.path.append ../.;

  mkSysConfig =
    mainRepo: inputs: extraModules: entry:
    mainRepo.lib.nixosSystem {
      specialArgs = inputs // {
        lib =
          lib
          // {
            liyua = import ./. { inherit lib; };
          }
          // mainRepo.lib;
      };
      modules = [
        (relativeToRoot "modules/system")
        (relativeToRoot "hosts/common")
        entry
      ]
      ++ extraModules;
    };
}
