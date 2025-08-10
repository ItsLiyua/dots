{ lib, ... }:
rec {
  relativeToRoot = lib.path.append ../.;

  mkSysConfig =
    mainRepo: inputs: extraModules: entry:
    mainRepo.lib.nixosSystem {
      specialArgs = inputs // {
        lib =
          lib
          # // mainRepo.lib
          // {
            liyua = import ./. { inherit lib; };
          };
      };
      modules = [
        (relativeToRoot "modules/system")
        (relativeToRoot "hosts/common")
        entry
      ]
      ++ extraModules;
    };
}
