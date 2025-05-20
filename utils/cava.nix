{ 
  stylix.targets.cava.rainbow.enable = true;
  programs.cava = {
    enable = true;
    settings = {
      general.framrate = 60;
      input = {
        method = "pipewire";
        source = "auto";
      };
      smoothing.noice_reduction = 88;
    };
  };
}
