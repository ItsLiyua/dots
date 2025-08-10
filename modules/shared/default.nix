{ config, lib, ... }:
{
  options.liyua.unfree = {
    enable = lib.mkEnableOption "Usage of unfree packages";
    whitelist = lib.mkOption {
      default = [ ];
      example = [ "steam" ];
      description = "Specify allowed unfree packages";
      type = with lib.types; listOf (uniq str);
    };
  };
  config.nixpkgs.config.allowUnfreePredicate =
    pkg: config.liyua.unfree.enable && builtins.elem (lib.getName pkg) config.liyua.unfree.whitelist;
}
