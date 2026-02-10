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
    rofi  # program launcher
    brightnessctl
    hyprshot # screensho
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      source = [
        "~/.config/hypr/temp-hyprland.conf"
      ];
      bind = [
        "${mainMod}, W, exec, wlogout-script"
      ];
    };
  };
  home.sessionVariables.NIXOS_OZONE_WL = "1"; # tell electron apps to use Wayland
  # home.pointerCursor = {
  #   enable = true;
  #   package = pkgs.hyprcursor;
  #   name = "simple cursor";
  #   size = 240;
  #   hyprcursor.enable = true;
  #   hyprcursor.size = 240;
  # };
}
