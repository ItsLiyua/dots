{
  users.users.liyua = {
    description = "Liyua";
    isNormalUser = true;
    useDefaultShell = true;
    initialHashedPassword = "$y$j9T$9GiQAXVMVzvYEdZvJgU341$s1OB.HLE98wD0bSNfyUUj7W1gDkDGWijm61nhCeCNe2";
    extraGroups = [
      "wheel"
      "networkmanager"
      "audio"
      "video"
      "input"
      "power"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILtyKAptgaf6VNiQPw6GvoC8/89u5+PMsQsqa8G7R4J/ liyua@resolute"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHKZZyrwb0depJAXqeoN8+q8kquwgAHz3uRssneGDtp0 liyua@liberty"
    ];
  };
}
