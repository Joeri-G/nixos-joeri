{ config, pkgs, ... }:

{
  programs.thunderbird = {
    enable = true;
    profiles."Default" = {
      isDefault = true;
    };
  };
  # TODO add accounts via this method
}
