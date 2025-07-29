{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
  ];
  # fonts.fontconfig.enable = true;
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        position = "bottom";
        height = 24;
        modules-left = [
          "battery"
          "disk"
          "CPU"
          "memory"
          "temperature"
          # "Hyprland"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          # "Sndio"
          "mpris"
          "idle_inhibitor"
          "sndio"
          "user"
          "custom/wlogout"
          # "upower"
        ];
        # modules
        clock = {
          interval = 1;
          format = "{:%H:%M}";
          format-alt = "{:%A, %B %d, %Y (%H:%M:%S)}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          actions =  {
            on-click-right = "mode";
            on-scroll-down = "shift_up";
            on-scroll-up = "shift_down";
          };
        };
        # custom modules
        "custom/wlogout" = {
          on-click = "wlogout-script";
          format = "wlogout";
        };
      };
    };
  };
}
