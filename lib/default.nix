{ lib, liyua }:
rec {
  relativeToRoot = lib.path.append ../.;

  sopsFileSystem = relativeToRoot "secrets/hosts/${liyua.spec.hostName}.yaml";

  sopsFileUser = relativeToRoot "secrets/users/${liyua.spec.user.name}.yaml";
}
