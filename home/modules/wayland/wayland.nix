{ config, pkgs, ... }:
let
  resources = ../../resources;
  scripts = "${resources}/scripts";
  lidswitch-script = pkgs.writeShellScriptBin "lidswitch-script" (builtins.readFile "${scripts}/lidswitch.sh");
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

    # custom scripts
    lidswitch-script
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      source = [
        "~/.config/hypr/temp-hyprland.conf"
      ];
      exec = [
        "lidswitch-script"
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
