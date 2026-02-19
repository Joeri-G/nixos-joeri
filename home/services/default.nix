{ ... }:

{
  imports = [
    ./hypridle.nix  # sleep daemoon
    ./darkman.nix   # light/dark theme based on sunset
    ./mako.nix      # wayland notifications
    ./protonmail-bridge.nix
  ];
}
