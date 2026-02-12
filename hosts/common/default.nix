# Common configuration for all hosts
{
  pkgs,
  lib,
  inputs,
  config,
  outputs,
  ...
}: {
  imports = [
    ../../home/users
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs outputs; };
    useGlobalPkgs = true;
  };
  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
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
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet -r -t --cmd start-hyprland";
        user = "greeter";
      };
    };
  };
  security.pam.services.hyprlock = {};

  sops = {
    defaultSopsFile = ../../secrets/sops-secrets.yaml;
    defaultSopsFormat = "yaml";
    validateSopsFiles = false;

    age = {
      keyFile = "/home/joeri/.config/sops/age/keys.txt";
      # Buggs out on fresh installs, sometimes. Probably because the home dir does not (yet)
      # exist when home-manager is first installed. Use absolute path for first install as a hack-around.
      # keyFile = "${config.home.homeDirectory}/sops/age/keys.txt";
      generateKey = true;
    };
  };
  programs.gnupg.agent = {
    enable = true;
  };
  environment.systemPackages = with pkgs; [
    git
    # inputs.agenix.packages."${system}".default
  ];
}
