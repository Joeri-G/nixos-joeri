{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    (vscode-with-extensions.override {
      vscode = vscodium;
      vscodeExtensions = with vscode-extensions; [
        jnoortheen.nix-ide
        ms-vscode.live-server
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      ];
    })
  ];
}
