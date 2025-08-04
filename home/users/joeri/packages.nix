{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neofetch
    signal-desktop
    wget
  ];
}