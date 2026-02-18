{ config, pkgs, ... }:

{
  imports = [
    ./hyprlock.nix
    ./hyprcursor.nix
    ./waybar.nix
    ./wayland.nix
    ./wlogout.nix
    ./swww.nix
  ];
}
