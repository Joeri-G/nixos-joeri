{ config, pkgs, ... }:

{
  programs.waylogout = {
    enable = true;
    settings = {
      color = "808080";
      effect-blur = "7x4";
      poweroff-command = "systemctl poweroff";
      reboot-command = "systemctl reboot";
      scaling = "fit";
      screenshots = true;
    };
  };
}
