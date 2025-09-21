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
.background {
  background: rgba(0, 0, 0, 0.5);
  color: #fff;
  font-size: 12px;
  border-top: 2px solid rgba(80, 73, 69, 0.5);
}

.modules-left, .modules-right, .modules-center {
  margin: 0 0.5em;
}

window#waybar {
  padding: 0 24px;
  background: rgba(255, 255, 255, 0.25);
}

#battery {
  background-color: #2a2;
  padding: 0 4px;
}

#workspaces {
  margin: 4px;
  font-size: 10px;
}

#workspaces button {
  background: rgba(80, 73, 69, 0.5);
  border: none;
  border: 1px solid black;
  padding: 0px 1px;
  border-radius: 0;
  margin: 0 1px;
}


#workspaces button.active { 	
  background-color: rgba(131, 165, 152, 0.5);
  box-shadow: none;
}

#workspaces button:hover {
  background-color: rgba(189, 174, 147, 0.5);
}
    '';
  };
}
