{ config, lib, pkgs, ... }:

{
  services.hypridle = {
    enable = true;
    settings = {
      listener = [
        {
          timeout = 180;
          on-timeout = "pidof hyprlock | hyprlock";
        }
        {
          timeout = 240;
          on-timeout = "hyprctl dispatch dpms off"; # screen off when timeout has passed
          on-resume = "hyprctl dispatch dpms on";   # screen on when activity is detected after timeout has fired.
        }
      ];
    };
  };
}