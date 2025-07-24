{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprpaper
  ];
  systemd.user.services.hyprpaper-daemon = {
    Unit = {
      Description = "Start a hyprpaper instance.";
    };
    Install = {
      WantedBy = [
        "hyprland-manager.target"
      ];
    };
    Service = {
      ExecStart = ''${pkgs.hyprpaper}/bin/hyprpaper'';
    };
  };
}