{ config, lib, pkgs, inputs, ... }: {
	imports = [
    ./options.nix
    ./keymap.nix
    ./theme.nix
    ./plugins/plugins.nix
  ];
}
