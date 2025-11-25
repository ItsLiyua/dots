{
  lib,
  pkgs,
  ...
}:
{
  vim = {
    languages.java = {
      enable = true;
      lsp.package =
        let
          lombok = "${pkgs.lombok}/share/java/lombok.jar";
        in
        [
          (lib.getExe pkgs.bash)
          "-c"
          "${lib.getExe pkgs.jdt-language-server} -data $HOME/.cache/jdtls/workspace --jvm-arg=-javaagent:${lombok} --jvm-arg:-Xbootclasspath/a:${lombok}"
        ];
    };
    formatter.conform-nvim = {
      setupOpts = {
        formatters.google-java-format.command = "${pkgs.google-java-format}/bin/google-java-format";
        formatters_by_ft.java = [ "google-java-format" ];
      };
    };
  };
}
