{ pkgs, ... }:
  let
    resources = ../../../resources;
    styles = "${resources}/styles/waybar.css";
    icons = "${resources}/icons";
    wallpapers = "${resources}/wallpapers";
  in
{
  home.packages = with pkgs; [
    hyprpicker
    blueman
    bluez
    yay
    font-awesome
    killall
  ];

  # Waybar configuration
  # based on https://github.com/sephid86/fulleaf/tree/master/skel/.config/waybar
  programs.waybar = {
    enable = true;
    style = builtins.readFile "${styles}";
    settings = {
      mainBar = {
        mode = "dock";
        exclusive = true;
        start_hidden = false;
        reload_style_on_change = true;
        height = 24;
        modules-left = [
          "image#wallpaper"
          "hyprland/workspaces"
          # "hyprland/mode"
          # "hyprland/scratchpad"
          "backlight"
          "idle_inhibitor"
          "temperature"
          "cpu"
          "memory"
          # "custon/theme-toggle"
        ];
        modules-center = [
          "hyprland/window"
        ];
        modules-right = [
          "mpris"
          "network"
          "bluetooth"
          "pulseaudio"
          # "keyboard-state"
          "battery"
          "tray"
          # "custom/notification"
          "clock"
        ];

        "image#wallpaper" = {
          path = "${icons}/nixos-logo-gradient.png";
          interval = 100000000000;
          tooltip = true;
          tooltip-format = "Change the wallpaper for this monitor";
          on-click = "wallpaper-menu ${wallpapers}";
        };
        
        keyboard-state = {
          numlock = true;
          capslock = true;
          format = "{name} {icon}";
          format-icons = {
            locked = "";
            unlocked = "";
          };
          interval =  60;
        };
        
        "hyprland/mode" = {
          format = "<span style=\"italic\">{}</span>";
          interval =  60;
        };
        
        "hyprland/scratchpad" = {
          format = "{icon} {count}";
          show-empty = false;
          format-icons = [ "" "" ];
          tooltip = true;
          interval =  60;
          tooltip-format = "{app}= {title}";
        };
        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "&#xf06e;";
            deactivated = "&#xf070;";
          };
          interval =  60;
        };

        "custon/theme-toggle" = {
          
        };
        
        tray = {
          spacing = 10;
          interval =  60;
        };

        clock = {
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          format = "{:%H:%M %d %b}";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            format = {
              # months =     "<span color='#ffead3'><b>{}</b></span>";
              # days =       "<span color='#ecc6d9'><b>{}</b></span>";
              # weeks =      "<span color='#99ffdd'><b>W{}</b></span>";
              # weekdays =   "<span color='#ffcc66'><b>{}</b></span>";
              # today =      "<span color='#ff6699'><b><u>{}</u></b></span>";
              months =     "<span><b>{}</b></span>";
              days =       "<span><b>{}</b></span>";
              weeks =      "<span><b>W{}</b></span>";
              weekdays =   "<span><b>{}</b></span>";
              today =      "<span><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-click-right = "mode";
            on-scroll-up = [
              "tz_up"
              "shift_up"
            ];
            on-scroll-down = [
              "tz_down"
              "shift_down"
            ];
          };
        };

        cpu = {
          format = "&#xf2db; {usage}%";
          interval =  60;
        };

        memory = {
          format = "&#xf538; {}%";
          interval =  60;
        };

        temperature = {
          thermal-zone = 2;
          hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
          critical-threshold = 80;
          format-critical = "{icon} {temperatureC}°C";
          format = "{icon} {temperatureC}°C";
          format-icons = [ "&#xf2c7;" "&#xf2c9;" "&#xf2ca;" ];
          interval =  60;
        };

        backlight = {
          format = "{icon} {percent}%";
          format-icons = [ "" "" "" "" "" "" "" "" "" ];
          interval =  60;
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "&#xe55b; {capacity}%";
          format-plugged = "&#xf1e6; {capacity}%";
          format-alt = "{icon} {time}";
          format-icons = [ "&#xf794;" "&#xf243;" "&#xf242;" "&#xf241;" "&#xf240;" ];
        };

        network = {
          format-wifi = "&#xf1eb; ({signalStrength}%) {essid}";
          format-ethernet = "&#xf796; {ifname}";
          tooltip-format = "&#xf6ff; {ifname} via {gwaddr}";
          format-linked = "?? {ifname} (No IP)";
          format-disconnected = "Disconnected ⚠ {ifname}";
          format-alt = "?? {ifname}= {ipaddr}/{cidr}";
          interval = 60;
        };

        bluetooth = {
          format = " {status}";
          format-connected = " {device_alias}";
          format-connected-battery = " {device_alias} {device_battery_percentage}%";
          tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
          interval =  60;
        };

        pulseaudio = {
          scroll-step = 5;
          format = "{icon} {volume}% {format_source}";
          format-bluetooth = " {volume}% {format_source}";
          format-bluetooth-muted = "  {format_source}";
          format-muted = "  {format_source}";
          format-source = " {volume}%";
          format-source-muted = "";
          format-icons = {
            default = [ "" "" "" ];
          };
          on-click = "pavucontrol";
          on-click-right = "foot -a pw-top pw-top";
          interval =  60;
        };

      #   "custom/notification" = {
      #     tooltip = true;
      #     format = "<span size='16pt'>{icon}</span>";
      #     format-icons = {
      #       notification = "󱅫";
      #       none = "󰂜";
      #       "dnd-notification" = "󰂠";
      #       "dnd-none" = "󰪓";
      #       "inhibited-notification" = "󰂛";
      #       "inhibited-none" = "󰪑";
      #       "dnd-inhibited-notification" = "󰂛";
      #       "dnd-inhibited-none" = "󰪑";
      #     };
      #     return-type = "json";
      #     exec-if = "which swaync-client";
      #     exec = "swaync-client -swb";
      #     on-click = "swaync-client -t -sw";
      #     on-click-right = "swaync-client -d -sw";
      #     escape = true;
      #     interval =  60;
      #   };
      };
    };
  };
}
