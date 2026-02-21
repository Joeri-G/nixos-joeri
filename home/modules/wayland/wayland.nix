{ config, pkgs, ... }:
let
  resources = ../../../resources;
  scripts = "${resources}/scripts";
  lidswitch-script = pkgs.writeShellScriptBin "lidswitch-script" (builtins.readFile "${scripts}/lidswitch.sh");
  switch-gtk-theme = pkgs.writeShellScriptBin "switch-gtk-theme" ''
    #!/usr/bin/env bash
    if [[ "$1" != "dark" && "$1" != "light" ]]; then 
        echo "pick light or dark"
        exit 1
    fi
    dconf write "/org/gnome/desktop/interface/gtk-theme" "'Zukitre-$1'"
    dconf write "/org/gnome/desktop/interface/color-scheme" "'prefer-$1'"
  '';
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
      bind = [
        # open background switcher
        "SUPER, B, exec, wallpaper-menu ${resources}/wallpapers"
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
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
