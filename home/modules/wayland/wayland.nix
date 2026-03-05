{ config, pkgs, ... }:
let
  resources = ../../../resources;
  scripts = "${resources}/scripts";
  lidswitch-script = pkgs.writeShellScriptBin "lidswitch-script" (builtins.readFile "${scripts}/lidswitch.sh");
  switch-gtk-theme = pkgs.writeShellScriptBin "switch-gtk-theme" (builtins.readFile "${scripts}/switch-gtk-theme.sh");
  waybar-double-tap-helper = pkgs.writeShellScriptBin "waybar-double-tap-helper" (builtins.readFile "${scripts}/waybar-double-tap-test.sh");
in 
{
  home.packages = with pkgs; [
    qt5.qtwayland
    qt6.qtwayland
    brightnessctl
    hyprshot
    dconf
    nwg-look
    glib
    zuki-themes
    # custom scripts
    lidswitch-script
    switch-gtk-theme
    waybar-double-tap-helper
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      xwayland = {
        force_zero_scaling = true;
      };
      source = [
        "~/.config/hypr/temp-hyprland.conf"
      ];
      exec = [
        "lidswitch-script"
      ];
      bind = [
        # open background switcher
        "SUPER, B, exec, wallpaper-menu ${resources}/wallpapers"
        # show waybar on double tap
        "SUPER, SUPER_L, exec, waybar-double-tap-helper"
      ];
    };
  };
  home.sessionVariables.NIXOS_OZONE_WL = "1"; # tell electron apps to use Wayland

  gtk = {
    enable = true;
    theme = {
      name = "Zukitre-dark";
    };
  };

  # org.freedesktop.portal.Settings must return something for Librewolf to be able to detect the theme.

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
