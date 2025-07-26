{ config, pkgs, ... }:

{
  imports = [
    ./hyprlock.nix
    ./waybar.nix
    ./wayland.nix
    ./waylogout.nix
  ];
}
