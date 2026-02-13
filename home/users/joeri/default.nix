{
  config,
  pkgs,
  inputs,
  ...
}:

{
  users.users.joeri = {
    hashedPasswordFile = config.sops.secrets.joeri-password.path; # SOPS exposes a file containing the secret.
    isNormalUser = true;
    description = "joeri";
    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
      "flatpak"
      "audio"
      "video"
      "plugdev"
      "input"
      "kvm"
      "qemu-libvirtd"
    ];
    packages = [inputs.home-manager.packages.${pkgs.system}.default];
  };
  home-manager.users.joeri = import ./home.nix;
}
