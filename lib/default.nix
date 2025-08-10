{ lib, ... }:
rec {
  relativeToRoot = lib.path.append ../.;

  mkSysConfig =
    mainRepo: inputs: extraModules: entry:
    let
      myLib = mainRepo.lib.extend (_: _: { liyua = import ./. { inherit (mainRepo) lib; }; });
    in
    myLib.nixosSystem {
      specialArgs = myLib.recursiveUpdate inputs { lib = myLib; };
      modules = [
        (relativeToRoot "modules/system")
        (relativeToRoot "hosts/common")
        entry
      ]
      ++ extraModules;
    };
}
