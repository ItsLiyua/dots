{ lib, ... }:
rec {
  relativeToRoot = lib.path.append ../.;

  mkSysConfig =
    mainRepo: inputs: extraModules: entry:
    let
      myLib = lib.extend (
        _: _: mainRepo.lib.extend (_: _: { liyua = import ./. { inherit (mainRepo) lib; }; })
      );
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
