{ config, pkgs, ... }:

{
  accounts.calendar.accounts."Leiden Rooster" = {
    thunderbird = {
      enable = true;
    };
    remote = {
      type = "http";
      url = "https://rooster.universiteitleiden.nl/ical?eu=czQ5NjMxNDhAbGVpZGVudW5pdi5ubA==&h=3wRUsD__YgTF5e2-cFZzERyhQCAMlNDh6-o-hIWFdJQ=";
    };
  };
}