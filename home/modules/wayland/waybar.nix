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
          "hyprland/workspaces"
        ];
        modules-right = [
          # "Sndio"
          "mpris"
          "idle_inhibitor"
          "sndio"
          "user"
          "custom/wlogout"
          "clock"
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
        "hyprland/workspaces" = {
            active-only = false;
            disable-scroll = false;
            format = "{icon}";
            on-click = "activate";
            format-icons = {
              "1" = "1";
              "2" = "2";
              "3" = "3";
              "4" = "4";
              "5" = "5";
              urgent = "!";
              default = "*";
              sort-by-number = true;
            };

            persistent-workspaces = {
              "1" = [ ];
              "2" = [ ];
              "3" = [ ];
              "4" = [ ];
              "5" = [ ];
            };
          };
      };
    };
    style = ''
        #workspaces {
          margin: 4px 7px 4px 7px;
          border-radius: 8px;
          border-width: 2px;
          border-color: rgba(80, 73, 69, 0.5);
          border-style: solid;
          background-color:  rgba(102, 92, 84, 0.5);
        }

        #workspaces button {
          border: none;
          padding: 1px 2px 1px 2px;
          border-radius: 5px;
        }

        #workspaces button.active { 	
          background-color: rgba(131, 165, 152, 0.5);
          box-shadow: none;
          border: none;
        }

        #workspaces button:hover {
          background-color: rgba(189, 174, 147, 0.5);
        }
    '';
  };
}
