{ config, lib, pkgs, ... }:
{
  services.darkman = {
    enable = true;
    settings = {
      # no idea where these point
      lat = 52.010;
      lng = 4.356;
      usegeoclue = false;
      dbusserver = true;
      portal = true;
    };
    darkModeScripts = {
      # reload wallpaper
      color-theme = ''
        wallpaper-select "$(swww query | awk -F 'image: ' '{print $2}')" &&
        switch-gtk-theme dark
      '';
    };
    lightModeScripts = {
      # reload wallpaper
      color-theme = ''
        wallpaper-select "$(swww query | awk -F 'image: ' '{print $2}')" &&
        switch-gtk-theme light
      '';
    };  
  };
}