{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # communication
    signal-desktop
    whatsie # whatsapp client
    telegram-desktop

    # general tools
    neofetch
    wget
    bottom # terminal resource monitor
    hyprshot

    # music
    tonelib-zoom
  ];
}