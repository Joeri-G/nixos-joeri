{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        ms-vscode.live-server
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [ ];
      userSettings = {
        nix = {
          "serverPath" = "nixd";
          "enableLanguageServer" = true;
          "formatterPath" = "nixfmt";
        };
        "nixpkgs" = {
            "expr" ="import <nixpkgs> { }";
          };
        "formatting" = {
          "command" = [
            "nixfmt"
          ];
        };
        "update.showReleaseNotes" = false;

        "window.autoDetectColorScheme" = true;
        "workbench.preferredLightColorTheme" = "Default Light+";

        git = {
          "autofetch" = true;
          "confirmSync" = false;
        };
      };
      keybindings = [
        {
          key = "ctrl+tab";
          command = "workbench.action.nextEditor";
        }
        { 
          key = "ctrl+shift+tab";
          command = "workbench.action.previousEditor";
        }
      ];
    };
  };

  home.packages = with pkgs; [
    nixd # nix language server
  ];
}
