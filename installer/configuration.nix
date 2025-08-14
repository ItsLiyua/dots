{ liyua, pkgs, ... }:
{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  users.users = {
    liyua = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      password = "nixos";
    };
    root.password = "nixos";
  };

  environment.systemPackages = with pkgs; [
    wget
    sops
    ssh-to-age
    just
  ];

  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "yes";
  };

  networking.firewall.enable = false;

  system.stateVersion = "25.11";
}
