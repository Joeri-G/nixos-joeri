{ pkgs, ... }:
let
  scripts = ../../../resources/scripts;
in
{
  programs.hyprlock = {
    enable = true;
  };

  home.packages = [
    (pkgs.writeShellScriptBin "restart-hyprlock" (builtins.readFile "${scripts}/restart-hyprlock.sh"))
  ];
}
