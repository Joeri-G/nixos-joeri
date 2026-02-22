{ pkgs, ... }:
let
  scripts = ../../../resources/scripts;
in
{
  programs.hyprlock = {
    enable = true;
    extraConfig = ''
      source = ../../.cache/wal/colors-hyprland.conf;
    '';
    settings = {
      general = {
        hide_cursor = true;
        ignore_empty_input = true;
        grace = 0;
        disable_loading_bar = true;
        fail_timeout = 500;
      };
      background = [
          {
            path = "screenshot";
            color = "$foreground";
            blur_passes = 2;
            contrast = 0.8916;
            brightness = 0.8172;
            vibrancy = 0.1696;
            vibrancy_darkness = 0.0;
          }
        ];
      input-field = [
        {
          size = "2000, 200";
          outline_thickness = 0;
          dots_size = 0.1;
          dots_spacing = 0.15;
          dots_center = true;
          outer_color = "rgba(0, 0, 0, 0)";
          inner_color = "rgba(0, 0, 0, 0)";
          check_color = "rgba(0, 0, 0, 0)";
          fail_color = "rgba(255, 0, 0, 0.75)";
          fade_on_empty = true;
          placeholder_text = "";
          hide_input = false;
          position = "0, -200";
          halign = "center";
          valign = "center";
        }
      ];
      label = [
        {
          text = "cmd[update:10] echo \"$(date +\"%H:%M\")\"";
          # color = "#cdd6f4";
          color = "$foreground";
          font_size = 200;
          font_family = "JetBrains Mono Ultra-Bold";
          position = "0, -200";
          halign = "center";
          valign = "top";
        }
      ];
    };
  };

  home.packages = [
    (pkgs.writeShellScriptBin "restart-hyprlock" (builtins.readFile "${scripts}/restart-hyprlock.sh"))
  ];
}
