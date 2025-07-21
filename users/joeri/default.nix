{
  config,
  pkgs,
  inputs,
  ...
}: {
  users.users.joeri = {
    initialHashedPassword = "$y$j9T$4RXTEuYH/1WwVZ9xBMfAz/$LP8O9TOUTV1KCG8lxsAu0jIWVcllZ85zskZdXaFi3DD";
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
    openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCge/8Xg9tN2vZ7Bh1miBZOodOtQ1P742Uf6Pb3N5Jy6phyYYR+SY3jOt+M/BDUAHWnTMS2hc8lzZhI3/mwyXqX/rIDqQUCCBS4m64ESZVEv6VarYi2ZDuPWwg/35v1LaPAtNzYEuf2wkiHhQ3RcGABsFBhWPjJswjdg0hIOT2vrILOW7Rze/wfvdy7OJIAIpJJdiIB1VK3ABQXOiZcEUbv9CigQuEptGIdXKIDMuMjthsFQiW1B9GY76lccDP4T8qPwSJNVuiGOXis7/nmdR+LD0B0GXEHJ/vno2Cm3wzI840WoU66eD/9uqwYgnXvXQvTRl+4h8TEVErKdLaKx0urkhNPyPrP4iQsIodmCqSbXGzSGP3k9vbC7dOnCsJeJjJ3wnsUjU3SM3NUr3vSjXqScHNK08bGYmC/yQMBDavVE2Zo4g2Hs65m+dULEH6beDeJ+cKDPefr0hCtmv5wndSavT/OVgwhKrsQ3Q7SwJKXV6Uv0M7C+LPuxRokiVtPavc= joeri@Joeri-Laptop"
    ];
    packages = [inputs.home-manager.packages.${pkgs.system}.default];
  };
  home-manager.users.joeri = import ./home.nix;
}
