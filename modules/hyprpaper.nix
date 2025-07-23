{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    hyprpaper
  ];

  # TODO:
  # add logic here that cycles through background images
}