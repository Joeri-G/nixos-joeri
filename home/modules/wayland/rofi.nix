{ pkgs, ... }:
let 
  resources = ../../../resources;
  scripts = "${resources}/scripts";
  launcher = pkgs.writeShellScriptBin "launcher" (builtins.readFile "${scripts}/launcher.sh");
in {
  programs.rofi = {
    enable = true;
    theme = "~/.cache/wal/colors-rofi-dark.rasi";
  };

  home.packages = [
    launcher
  ];
}
