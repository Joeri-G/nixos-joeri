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
    # themechanger
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
  # gtk = {
  #   enable = true;

  #   theme = {
  #     package = pkgs.flat-remix-gtk;
  #     name = "Flat-Remix-GTK-Grey-Darkest";
  #   };

  #   iconTheme = {
  #     package = pkgs.adwaita-icon-theme;
  #     name = "Adwaita";
  #   };

  #   font = {
  #     name = "Sans";
  #     size = 11;
  #   };
  # };
}
