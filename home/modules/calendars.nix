{ config, pkgs, ... }:

{
  accounts.calendar.accounts."Leiden Rooster" = {
    thunderbird = {
      enable = true;
    };
  };
}