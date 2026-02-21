{ config, lib, pkgs, ... }:
{
  programs.fish = {
    enable = true;
    shellInit = ''
      cat ~/.cache/wal/sequences
    '';
  };
}