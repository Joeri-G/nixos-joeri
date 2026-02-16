{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # communication
    signal-desktop
    zapzap # WhatsApp Client
    telegram-desktop

    # general tools
    neofetch
    wget
    curl
    bottom # terminal resource monitor
    kdePackages.dolphin

    # music
    # tonelib-zoom # broken

    # password stuff
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
    # obsidian
    logseq # open source obsidian equivalent
    tor-browser
    qbittorrent
    vlc
    gimp
  ];
}
