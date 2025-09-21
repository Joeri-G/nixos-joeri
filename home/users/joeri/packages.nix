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
  ];
}
