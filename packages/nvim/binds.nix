{ lib, ... }:
{
  vim.keymaps = [
    {
      key = "<ESC>";
      mode = [ "n" ];
      action = "<cmd>nohl<CR>";
      silent = true;
      desc = "Clear highlighting";
    }
    {
      key = "<Tab>";
      mode = [ "n" ];
      action = "<cmd>BufferLineCycleNext<CR>";
      silent = true;
      desc = "Cycle to next buffer";
    }
    {
      key = "<S-Tab>";
      mode = [ "n" ];
      action = "<cmd>BufferLineCyclePrev<CR>";
      silent = true;
      desc = "Cycle to previous buffer";
    }
  ]
  ++ (
    lib.range 1 10
    |> map (i: {
      key = "<leader>${(if i == 10 then 0 else i) |> toString}";
      mode = [ "n" ];
      action = "<cmd>BufferLineGoToBuffer ${toString i}";
      silent = true;
      desc = "Go to Buffer ${toString i}";
    })
  );
}
