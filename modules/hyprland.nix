{ config, pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # withUWSM = true;
    # systemd.setPath.enable = true;
  };
  # programs.uwsm = {
  #   enable = true;
  #   waylandCompositors.hyprland = {
  #     prettyName = "Hyprland";
  #     comment = "Hyprland compositor managed by UWSM";
  #    binPath = "${pkgs.hyprland}/bin/hyprland";
  #   };
  # };
  services.displayManager.enable = true; 
  services.displayManager.cosmic-greeter = {
    enable = true;
  };

  # environment.sessionVariables.NIXOS_OZONE_WL = "1";
  # environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

  environment.systemPackages = with pkgs; [
    kitty
    gtk3
    qt5.qtwayland
    qt6.qtwayland
    wofi
  ];
}
