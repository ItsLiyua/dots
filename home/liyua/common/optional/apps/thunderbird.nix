{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.liyua.apps.thunderbird.enable = lib.mkEnableOption "Thunderbird E-Mail and Calendar client";
  config = lib.mkIf config.liyua.apps.thunderbird.enable {
    programs.thunderbird = {
      enable = true;
      profiles.default = {
        isDefault = true;
        name = "default";
      };
    };
    # accounts = {
    #   calendar = {
    #     accounts = {
    #       general = {
    #         name = "General";
    #         remote = {
    #           type = "caldav";
    # url =  TODO: Figure out whether this allows read access to my calendar without password
    #             passwordCommand = ''cat "${config.sops.secrets."liyua/calendar".path}"'';
    #           };
    #         };
    #       };
    #     };
    #   };
  };
}
