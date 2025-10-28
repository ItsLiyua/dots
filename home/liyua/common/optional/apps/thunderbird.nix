{
  config,
  lib,
  ...
}:
{
  options.liyua.apps.thunderbird.enable = lib.mkEnableOption "Thunderbird E-Mail and Calendar client";
  config = lib.mkIf config.liyua.apps.thunderbird.enable {
    programs.thunderbird = {
      enable = true;
      profiles.default = {
        isDefault = true;
      };
    };
  };
}
