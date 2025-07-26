{ config, lib, pkgs, ... }:

{
  services.hypridle = {
    enable = true;
    settings = {
      listener = [
        {
          timeout = 120;
          on-timeout = "hyprlock";
        }
      ];
    };
  };
}