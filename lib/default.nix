{ lib, ... }:
rec {
  relativeToRoot = lib.path.append ../.;

  mkSysConfig =
    mainRepo: inputs: extraModules: entry:
    mainRepo.lib.nixosSystem {
      specialArgs = inputs // {
        myLib = import ./. { inherit lib; };
      };
      modules = extraModules ++ [
        (relativeToRoot "modules/system")
        (relativeToRoot "hosts/common")
        entry
      ];
    };
  mkHomeConfig =
    pkgs: inputs: extraModules: entry:
    inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = inputs // {
        myLib = import ./. { inherit lib; };
      };
      modules = extraModules ++ [
        (relativeToRoot "modules/user")
        (relativeToRoot "home/liyua/common")
        entry
      ];
    };

}
