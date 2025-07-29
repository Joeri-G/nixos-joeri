{ config, pkgs, ... }:

{
  imports = [
    ./hyprlock.nix
    ./waybar.nix
    ./wayland.nix
    ./wlogout.nix
  ];
}
