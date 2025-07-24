{ config, lib, pkgs, ... }:

{
  # this service is required to force the graphical-session.target to be invoked
  systemd.user.targets.hyprland-manager = {
    Unit = {
      Description = "Target required for starting graphical-session.target";
    };
    Install = {
      RequiredBy = [ "default.targets" ];
      Wants = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
  };
}