{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.font-awesome
  ];
  # fonts.fontconfig.enable = true;
  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };
}
