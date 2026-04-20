{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # communication
    signal-desktop
    zapzap # WhatsApp Client
    telegram-desktop

    # general tools
    fastfetch
    wget
    curl
    bottom # terminal resource monitor
    kdePackages.dolphin
    systemctl-tui
    powertop

    # music
    # tonelib-zoom # broken

    # password stuff
    proton-pass
    # pass
    gnupg
    gcr
    seahorse

    # vpn
    proton-vpn

    # office tools
    libreoffice
    texliveTeTeX
    texstudio
    unzip
    # obsidian
    logseq # open source obsidian equivalent
    tor-browser
    qbittorrent
    vlc
    gimp

    # codec
    openh264

    # CSE
    zotero
  ];
}
