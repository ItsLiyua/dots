{ lib, ... }:
{
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILtyKAptgaf6VNiQPw6GvoC8/89u5+PMsQsqa8G7R4J/ liyua@resolute"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHKZZyrwb0depJAXqeoN8+q8kquwgAHz3uRssneGDtp0 liyua@liberty"
  ];
  services.openssh.settings.PermitRootLogin = lib.mkForce "prohibit-password";
}
