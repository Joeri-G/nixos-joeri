{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vdu_controls
  ];
}
