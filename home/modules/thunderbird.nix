{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    protonmail-bridge
  ];
  programs.thunderbird = {
    enable = true;
    profiles."Default" = {
      isDefault = true;
    };
  };
  # TODO: Add all accounts
  accounts.email.accounts = {
    "john@doe.com" = {
      thunderbird = {
        enable = true;
      };
      primary = true;
      realName = "John Doe";
      address = "john@doe.com";
      userName = "john";
      imap = {
        host = "example.com";
        tls = {
          useStartTls = true;
        };
      };
      smtp = {
        host = "example.com";
        tls = {
          useStartTls = true;
        };
      };
    };
  };
}
