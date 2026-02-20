{ config, lib, pkgs, ... }:
{
  programs.fish.shellInit = ''
    wal -R # restore color scheme
  '';
}