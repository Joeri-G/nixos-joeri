let
  configDir = ../../config;
in {
  home.file = {
    # ".config/hypr".source = "${configDir}/hypr";
    # temp hack untill config is moved into correct nix files
    ".config/hypr/temp-hyprland.conf".source = "${configDir}/hypr/hyprland.conf";
    # ".config/hypr/hyprpaper.conf".source = "${configDir}/hypr/hyprpaper.conf";
    ".config/hypr/keybinds.conf".source = "${configDir}/hypr/keybinds.conf";
    ".config/hypr/devices.conf".source = "${configDir}/hypr/devices.conf";
    ".config/hypr/monitors.conf".source = "${configDir}/hypr/monitors.conf";
    ".config/hypr/windows.conf".source = "${configDir}/hypr/windows.conf";
    ".config/hypr/workspaces.conf".source = "${configDir}/hypr/workspaces.conf";
  };
}
