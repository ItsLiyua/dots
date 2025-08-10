{ lib, ... }:
rec {
  relativeToRoot = lib.path.append ../.;

  mkSysConfig =
    mainRepo: inputs: extraModules: entry:
    let
      myLib = mainRepo.lib // {
        liyua = import ./. { inherit lib; };
      };
    in
    myLib.nixosSystem {
      specialArgs = inputs // {
        lib = myLib;
      };
      modules = [
        (relativeToRoot "modules/system")
        (relativeToRoot "hosts/common")
        entry
      ]
      ++ extraModules;
    };
}
