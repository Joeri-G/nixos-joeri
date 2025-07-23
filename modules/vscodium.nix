{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vscodium
  ];

  # firefox profile config here at some point
}
