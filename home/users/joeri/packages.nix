{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neofetch
    signal-desktop
    wget
    bottom # terminal resource monitor
    hyprshot
  ];
}