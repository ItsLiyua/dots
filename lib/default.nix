{ lib }:
rec {
  relativeToRoot = lib.path.append ../.;

  mkSysConfig =
    mainRepo: inputs: extraModules: entry:
    let
      localLib = lib.extend (_: _: { liyua = import ./. { inherit (mainRepo) lib; }; });
    in
    lib.nixosSystem {
      specialArgs = localLib.recursiveUpdate inputs { lib = localLib; };
      modules = [
        (relativeToRoot "modules/system")
        (relativeToRoot "hosts/common")
        entry
      ]
      ++ extraModules;
    };
}
