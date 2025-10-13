{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # communication
    signal-desktop
    # whatsie # whatsapp client
    # wasistlos # whatsapp client
    zapzap # WhatsApp Client
    telegram-desktop

    # general tools
    neofetch
    wget
    curl
    bottom # terminal resource monitor
    kdePackages.dolphin

    # music
    # tonelib-zoom

    # password stuff
    sops
    age
    proton-pass
    # pass
    gnupg
    gcr
    seahorse

    # vpn
    protonvpn-gui

    # office tools
    libreoffice
    texliveTeTeX
    texstudio
#    obsidian
    tor-browser
    qbittorrent
    vlc

    # rstudio
    # rPackages.curl
  ];
}
