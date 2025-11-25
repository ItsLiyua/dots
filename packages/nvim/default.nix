{ nvf, pkgs, ... }:
{
  buildPackage =
    {
      base16 ? null,
    }:
    (nvf.lib.neovimConfiguration {
      inherit pkgs;
      modules = [
        (
          if base16 != null then
            (
              { lib, ... }:
              {
                vim.theme = {
                  name = lib.mkForce "base16";
                  base16-colors = base16;
                };
              }
            )
          else
            { }
        )
        ./plugins
        ./binds.nix
        ./options.nix
      ];
    }).neovim;
}
