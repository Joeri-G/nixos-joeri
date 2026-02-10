{
  config,
  pkgs,
  inputs,
  ...
}:

{
  sops.secrets.joeri-password.neededForUsers = true;
  users.users.joeri = {
    # initialHashedPassword = "$y$j9T$4RXTEuYH/1WwVZ9xBMfAz/$LP8O9TOUTV1KCG8lxsAu0jIWVcllZ85zskZdXaFi3DD";
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

  programs.ssh.startAgent = true;
}
