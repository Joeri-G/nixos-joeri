{ config, lib, pkgs, ... }:
let 
  wallpaperDir = ../resources/wallpapers;
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
        "${wallpaperDir}/bridge.jpg"
        "${wallpaperDir}/brown-forest.jpg"
        "${wallpaperDir}/white-forest.jpg"
        "${wallpaperDir}/black-sand.jpg"
      ];

      wallpaper = [
        # ",${wallpaperDir}/pink-sky.jpg"
        # ",${wallpaperDir}/bridge.jpg"
        ",${wallpaperDir}/brown-forest.jpg"
        # ",${wallpaperDir}/white-forest.jpg"
        # ",${wallpaperDir}/green-forest.jpg"
        # ",${wallpaperDir}/black-sand.jpg"
      ];
    };
  };

  # TODO:
  # some settings that cycle my backgrounds
}
