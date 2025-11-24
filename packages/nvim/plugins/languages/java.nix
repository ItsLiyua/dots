{ pkgs, ... }:
{
  vim = {
    languages.java = {
      enable = true;
      # lsp.package = pkgs.jdt-language-server.override { jdk = pkgs.jdk17; };
    };
    formatter.conform-nvim = {
      setupOpts = {
        formatters.google-java-format.command = "${pkgs.google-java-format}/bin/google-java-format";
        formatters_by_ft.java = [ "google-java-format" ];
      };
    };
  };
}
