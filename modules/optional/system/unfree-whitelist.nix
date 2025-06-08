{ lib, ... }:
{
  options.liyua.allow-unfree = lib.mkOption {
    default = [ ];
    example = [ "steam" ];
    description = "Specify allowed unfree packages";
    type = with lib.types; listOf uniq str;
  };
  config.nixpkgs.config.allowUnfreePredicate =
    pkg: builtins.elem (lib.getName pkg) config.liyua.allow-unfree;
}
