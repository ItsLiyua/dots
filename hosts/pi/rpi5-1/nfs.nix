{
  services.nfs.server =
    let
      exportRoot = "/var/exports";
    in
    {
      enable = true;
      createMountPoints = true;
      exports = ''
        ${exportRoot}/music 10.15.0.0/24(rw,no_subtree_check)
      '';
    };
}
