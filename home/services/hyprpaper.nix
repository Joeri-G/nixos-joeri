{ config, lib, pkgs, ... }:
let
  wallpaperDir = ../../resources/wallpapers;
in {
  services.hyprpaper = {
    enable = false;
    settings = {
      ipc = "on";
      splash = false;

      preload = ["${wallpaperDir}/pink-sky.jpg"];

      wallpaper = [
        ",${wallpaperDir}/pink-sky.jpg"
      ];
    };
  };
}
