{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.liyua.btop.enable {
  security.wrappers.btop =
    let
      gpu = config.liyua.btop.gpuType;
      pkg =
        if gpu == "intel" then
          pkgs.btop
        else if gpu == "amd" then
          pkgs.btop-rocm
        else if gpu == "nvidia" then
          pkgs.btop-cuda
        else
          pkgs.btop;
    in
    {
      enable = true;
      owner = "root";
      group = "root";
      source = "${pkg}/bin/btop";
      capabilities = "cap_sys_admin=+ep";
    };
}
