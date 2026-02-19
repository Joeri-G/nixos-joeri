{ pkgs, ... }:
  let
    styles = ../../resources/styles/waybar.css;
  in
{
  home.packages = with pkgs; [
    hyprpicker
    blueman
    bluez
    swaynotificationcenter
    yay
    font-awesome
  ];

  # Waybar configuration
  programs.waybar = {
    enable = true;
    style = builtins.readFile "${styles}";
    settings = {
      mainBar = {
        height = 24;
        modules-left = [
          "hyprland/workspaces"
          "hyprland/mode"
          "hyprland/scratchpad"
          "custom/media"
        ];
        modules-center = [
          "hyprland/window"
        ];
        modules-right = [
          "mpris"
          "idle_inhibitor"
          "temperature"
          "cpu"
          "memory"
          "network"
          "bluetooth"
          "pulseaudio"
          "backlight"
          # "keyboard-state"
          "battery"
          "tray"
          "custom/notification"
          "clock"
        ];
        
        keyboard-state = {
          numlock = true;
          capslock = true;
          format = "{name} {icon}";
          format-icons = {
            locked = "";
            unlocked = "";
          };
        };
        
        "hyprland/mode" = {
          format = "<span style=\"italic\">{}</span>";
        };
        
        "hyprland/scratchpad" = {
          format = "{icon} {count}";
          show-empty = false;
          format-icons = [ "" "" ];
          tooltip = true;
          tooltip-format = "{app}= {title}";
        };
        
        mpd = {
          format = " {title} - {artist} {stateIcon} [{elapsedTime=%M=%S}/{totalTime=%M=%S}] {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}[{songPosition}/{queueLength}] [{volume}%]";
          format-disconnected = " Disconnected";
          format-stopped = " {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped";
          unknown-tag = "N/A";
          interval = 2;
          consume-icons = {
            on = " ";
          };
          random-icons = {
            on = " ";
          };
          repeat-icons = {
            on = " ";
          };
          single-icons = {
            on = "1 ";
          };
          state-icons = {
            paused = "";
            playing = "";
          };
          tooltip-format = "MPD (connected)";
          tooltip-format-disconnected = "MPD (disconnected)";
          on-click = "mpc toggle";
          on-click-right = "foot -a ncmpcpp ncmpcpp";
          on-scroll-up = "mpc volume +2";
          on-scroll-down = "mpc volume -2";
        };
        
        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };
        
        tray = {
          spacing = 10;
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
              months =     "<span color='#ffead3'><b>{}</b></span>";
              days =       "<span color='#ecc6d9'><b>{}</b></span>";
              weeks =      "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays =   "<span color='#ffcc66'><b>{}</b></span>";
              today =      "<span color='#ff6699'><b><u>{}</u></b></span>";
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
          format = " {usage}%";
        };

        memory = {
          format = " {}%";
        };

        temperature = {
          thermal-zone = 2;
          hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
          critical-threshold = 80;
          format-critical = "{icon} {temperatureC}°C";
          format = "{icon} {temperatureC}°C";
          format-icons = [ "" "" "" ];
        };

        backlight = {
          format = "{icon} {percent}%";
          format-icons = [ "" "" "" "" "" "" "" "" "" ];
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{icon} {time}";
          format-icons = [ "" "" "" "" "" ];
        };

        network = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = " {ifname}";
          tooltip-format = " {ifname} via {gwaddr}";
          format-linked = " {ifname} (No IP)";
          format-disconnected = "Disconnected ⚠ {ifname}";
          format-alt = " {ifname}= {ipaddr}/{cidr}";
        };

        bluetooth = {
          format = " {status}";
          format-connected = " {device_alias}";
          format-connected-battery = " {device_alias} {device_battery_percentage}%";
          tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
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
        };

        "custom/notification" = {
          tooltip = true;
          format = "<span size='16pt'>{icon}</span>";
          format-icons = {
            notification = "󱅫";
            none = "󰂜";
            "dnd-notification" = "󰂠";
            "dnd-none" = "󰪓";
            "inhibited-notification" = "󰂛";
            "inhibited-none" = "󰪑";
            "dnd-inhibited-notification" = "󰂛";
            "dnd-inhibited-none" = "󰪑";
          };
          return-type = "json";
          "exec-if" = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };

        mpris = {
          format = "🎵 {artist}-{title}";
          format-paused = "🎵⏸️ ";
          format-stopped = "🎵⏹️ ";
          max-length = 40;
          on-click = "playerctl play-pause";
        };
      };
    };
  };
}
