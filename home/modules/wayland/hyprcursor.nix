{ pkgs, ... }:

{
  home.pointerCursor = {
    dotIcons.enable = true;
    enable = true;
    hyprcursor = {
      enable = true;
      size = 24;
    };
    name = "rose-pine-hyprcursor";
    package = pkgs.rose-pine-hyprcursor;
  };
}