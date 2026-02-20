{
  pkgs,
  config,
  lib,
  ...
}:
let
  resources = ../../../resources;
  wallpapers = "${resources}/wallpapers";
  select-wallpaper = pkgs.writeShellScriptBin "select-wallpaper" (builtins.readFile "${resources}/scripts/select-wallpaper.sh");
  change-wallpaper = pkgs.writeShellScriptBin "change-wallpaper" (builtins.readFile "${resources}/scripts/change-wallpaper.sh");
in
{
  home.packages = with pkgs; [
    swww
    select-wallpaper
    change-wallpaper
  ];
  wayland.windowManager.hyprland.settings.exec = [
    "swww-daemon && change-wallpaper ${wallpapers}/black-sand.jpg"
  ];
}
