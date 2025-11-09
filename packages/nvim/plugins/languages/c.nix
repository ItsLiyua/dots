{ pkgs, ... }:
{
  vim = {
    languages.clang = {
      enable = true;
      cHeader = true;
    };

    formatter.conform-nvim = {
      setupOpts = {
        formatters.clang-format.command = "${pkgs.clang-tools}/bin/clang-format";
        formatters_by_ft.clang = [ "clang-format" ];
      };
    };
  };
}
