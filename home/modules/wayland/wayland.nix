{ config, pkgs, ... }:
let
  mainMod = "SUPER";
in 
{
  home.packages = with pkgs; [
    kitty
    gtk3
    qt5.qtwayland
    qt6.qtwayland
    rofi
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      source = "~/.config/hypr/temp-hyprland.conf";
      bind = [
        "${mainMod}, W, exec, wlogout-script"
      ];
    };
  };
  # home.pointerCursor = {
  #   enable = true;
  #   package = pkgs.hyprcursor;
  #   name = "simple cursor";
  #   size = 240;
  #   hyprcursor.enable = true;
  #   hyprcursor.size = 240;
  # };
}
