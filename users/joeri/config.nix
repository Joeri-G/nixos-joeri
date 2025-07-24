let
  configDir = ../../config;
  wallpaperDir = ../../resources/wallpapers;
in {
  home.file = {
    # ".config/hypr".source = "${configDir}/hypr";
    ".config/hypr/wallpapers".source = "${wallpaperDir}";
    ".config/hypr/hyprland.conf".source = "${configDir}/hypr/hyprland.conf";
    ".config/hypr/hyprpaper.conf".source = "${configDir}/hypr/hyprpaper.conf";
    ".config/hypr/devices.conf".source = "${configDir}/hypr/devices.conf";
    ".config/hypr/monitors.conf".source = "${configDir}/hypr/monitors.conf";
    ".config/hypr/windows.conf".source = "${configDir}/hypr/windows.conf";
  };
}
