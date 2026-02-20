{ config, pkgs, ... }:
  let
    whatsapp = pkgs.writeShellScriptBin "whatsapp" "librewolf --P whatsapp --kiosk --new-window https://web.whatsapp.com";
    deezer = pkgs.writeShellScriptBin "deezer" "librewolf --P deezer --kiosk --new-window https://www.deezer.com/";
  in
{
  xdg.desktopEntries = {
    deezer = {
      name = "Deezer";
      comment = "Open deezer in a kiosk browser profile";
      exec = "deezer";
      terminal = false;
      type = "Application";
      categories = [
        "Music"
        "AudioVideo"
      ];
    };
    whatsapp = {
      name = "Whatsapp";
      comment = "Open whatsapp in a kiosk browser profile";
      exec = "whatsapp";
      terminal = false;
      type = "Application";
      categories = [
        # TODO
      ];
    };
  };
  home.packages = with pkgs; [
    whatsapp
    deezer
  ];
}
