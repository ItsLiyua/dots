{
  description = "Installer for the big flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    disko.url = "github:nix-community/disko/latest";
  };
  outputs =
    {
      nixpkgs,
      ...
    }@inputs:
    let
      mkInstaller =
        name:
        nixpkgs.lib.nixosSystem {
          specialArgs = inputs;
          modules = [
            inputs.disko.nixosModules.disko
            ../modules/system
            ../hosts/${name}/modules/disko.nix
            ../hosts/${name}/hardware-configuration.nix
            ./configuration.nix
          ];
        };
    in
    {
      nixosConfigurations.t480 = mkInstaller "t480";
    };
}
