{ config, lib, ... }:
{
  config.nixpkgs.config.allowUnfreePredicate =
    pkg: builtins.elem (lib.getName pkg) config.liyua.allowedUnfree;
}
