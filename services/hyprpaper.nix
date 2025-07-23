{ config, lib, pkgs, ... }:
let 
  wallpaperDir = "${pkgs.writeText "wallpaperDir" ''../resources/wallpapers''}";
in
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [
        "${wallpaperDir}/green-forest.jpg"
        "${wallpaperDir}/pink-sky.jpg"
      ];

      wallpaper = [
        "${wallpaperDir}/pink-sky.jpg"
      ];
    };
  };
}
