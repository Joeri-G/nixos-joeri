{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    hyprpaper
  ];

  # TODO:
  # some settings that cycle my backgrounds
}
