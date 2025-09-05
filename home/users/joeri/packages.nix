{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # communication
    signal-desktop
    # whatsie # whatsapp client
    wasistlos # whatsapp client
    telegram-desktop

    # general tools
    neofetch
    wget
    bottom # terminal resource monitor

    # music
    # tonelib-zoom

    # password stuff
    sops
    age
  ];
}