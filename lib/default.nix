{ lib, ... }:
rec {
  relativeToRoot = lib.path.append ../.;

  mkSysConfig =
    mainRepo: inputs: extraModules: entry:
    mainRepo.lib.nixosSystem {
      modules = [
        (relativeToRoot "modules/system")
        (relativeToRoot "hosts/common")
        entry
      ]
      ++ extraModules;
      specialArgs = inputs // {
        lib = lib // {
          liyua = import ./. { inherit lib; };
        };
      };
    };
}
