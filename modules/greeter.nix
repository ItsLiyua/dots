{ config, lib, pkgs, ... }: {
  options.liyua.greeter.enable = lib.mkEnableOption "Greetd";
  config.services.greetd = lib.mkIf config.liyua.greeter.enable {
    enable = true;
    settings = {
      default_session = {
        command = ''
          ${pkgs.greetd.tuigreet}/bin/tuigreet -tr --asterisks --asterisks-char "*" --cmd Hyprland'';
        user = "greeter";
      };
    };
  };
}
