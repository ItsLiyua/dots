{ config, lib, pkgs, inputs, ... }: {
	imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
    ./keymap.nix
    ./colorscheme.nix
    ./plugins/plugins.nix
  ];
}
