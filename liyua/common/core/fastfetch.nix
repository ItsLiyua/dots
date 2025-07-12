{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos_old_small";
        padding.right = 4;
      };
      display = {
        size.binaryPrefix = "si";
        color = {
          keys = "blue";
          title = "red";
        };
        key = {
          width = 10;
          type = "string";
        };
        percent = {
          type = 9;
          color = {
            green = "green";
            yellow = "light_yellow";
            red = "light_red";
          };
        };
        separator = " ";
      };

      modules = [
        "title"
        "os"
        "host"
        "kernel"
        # "shell"
        "uptime"
        "packages"
        {
          type = "command";
          text = "echo $(nix-env --list-generations | grep current | awk '{print $1}'; echo '(nix-system)'; home-manager generations | head -1 | awk '{print $5}'; echo '(nix-user)') | tr -d '\n'";
          key = "Nix Gen";
        }
      ];
    };
  };
}
