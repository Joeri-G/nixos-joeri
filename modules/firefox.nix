{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    firefox
  ];

  # firefox profile config here at some point
}
