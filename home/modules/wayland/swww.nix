{
  pkgs,
  config,
  lib,
  ...
}:
let
  resources = ../../../resources;
  wallpapers = "${resources}/wallpapers";
  wallpaper-select = pkgs.writeShellScriptBin "wallpaper-select" (builtins.readFile "${resources}/scripts/wallpaper-select.sh");
  wallpaper-menu = pkgs.writeShellScriptBin "wallpaper-menu" (builtins.readFile "${resources}/scripts/wallpaper-menu.sh");
in
{
  home.packages = with pkgs; [
    swww
    wallpaper-select
    wallpaper-menu
  ];
  wayland.windowManager.hyprland.settings.exec = [
    "swww-daemon && wallpaper-select ${wallpapers}/black-sand.jpg"
  ];
}
