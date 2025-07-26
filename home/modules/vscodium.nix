{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    (vscode-with-extensions.override {
      vscode = vscodium;
      vscodeExtensions = with vscode-extensions; [
        jnoortheen.nix-ide
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      ];
    })
  ];
}
