{ config, lib, pkgs, inputs, ... }: {
	imports = [
    ./options.nix
    ./keymap.nix
    ./plugins/plugins.nix
  ];
}
