{ parentLib, ... }:
rec {
  relativeToRoot = parentLib.path.append ../.;

  mkSysConfig =
    mainRepo: inputs: extraModules: entry:
    let
      lib = mainRepo.lib.extend (
        _: _: parentLib // mainRepo.lib // { liyua = import ./. { inherit (mainRepo) lib; }; }
      );
    in
    lib.nixosSystem {
      specialArgs = lib.recursiveUpdate inputs { inherit lib; };
      modules = [
        (relativeToRoot "modules/system")
        (relativeToRoot "hosts/common")
        entry
      ]
      ++ extraModules;
    };
}
