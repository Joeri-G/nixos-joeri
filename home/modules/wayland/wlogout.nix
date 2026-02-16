{ config, pkgs, ... }:
  let
    resources = ../../resources;
    icons = "${resources}/icons";
    scripts = "${resources}/scripts";
    wlogout-script = pkgs.writeShellScriptBin "wlogout-script" (builtins.readFile "${scripts}/wlogout.sh");
    hover = "0";
    margin = "30";
    border-radius = "10";
    border-radius-active = "10";
  in
{
  
  home.packages = with pkgs; [
    wlogout-script
  ];

  wayland.windowManager.hyprland.settings = {
    bind = [
        "SUPER, W, exec, wlogout-script"
      ];
  };
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "logout";
        action = "hyprctl dispatch exit 0";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "lock";
        action = "pidof hyprlock | hyprlock";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "suspend";
        action = "pidof hyprlock | hyprlock & systemctl suspend-then-hibernate";
        text = "Suspend";
        keybind = "z";
      }
      {
        label = "hibernate";
        action = "pidof hyprlock | hyprlock & systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];
  };
}
