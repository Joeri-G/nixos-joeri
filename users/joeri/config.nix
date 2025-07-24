let configDir = ../../config;
in {
    home.file = {
        # Preferably I would link the entire folder, but since hyprpaper
        # has to place a config file there the folder cannot be read only
        ".config/hypr/includeme".source = "${configDir}/includeme";
        ".config/hypr/hyprland.conf".source = "${configDir}/hypr/hyprland.conf";
        ".config/hypr/devices.conf".source = "${configDir}/hypr/devices.conf";
        ".config/hypr/monitors.conf".source = "${configDir}/hypr/monitors.conf";
        ".config/hypr/windows.conf".source = "${configDir}/hypr/windows.conf";
    };
}
