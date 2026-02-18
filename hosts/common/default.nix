# Common configuration for all hosts
{
  pkgs,
  lib,
  inputs,
  config,
  outputs,
  nur,
  ...
}: {
  imports = [
    ../../home/users
    ./secrets.nix
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs outputs; };
    useGlobalPkgs = true;
  };
  nixpkgs = {
    config = {
      overlays = builtins.attrValues outputs.overlays;
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
      
    };
    # packageOverrides = pkgs: {
    #   unstable = import <unstable> {
    #     config = config.nixpkgs.config;
    #   };
    # };
  };

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      trusted-users = [
        "root"
        "joeri"
      ]; # Set users that are allowed to use the flake command
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
    optimise.automatic = true;
    registry =
      (lib.mapAttrs (_: flake: {inherit flake;}))
      ((lib.filterAttrs (_: lib.isType "flake")) inputs);
  };
  
  users.defaultUserShell = pkgs.fish;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet -r -t --cmd start-hyprland";
        user = "greeter";
      };
    };
  };
  security.pam.services.hyprlock = {};

  programs.gnupg.agent = {
    enable = true;
  };
  environment.systemPackages = with pkgs; [
    git
    # inputs.agenix.packages."${system}".default
  ];
}
