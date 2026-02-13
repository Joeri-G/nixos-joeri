{ inputs, config, pkgs, ...}:
  let secretsDir = ../../../secrets;
  in {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];
  sops = {
    age = {
      keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
      generateKey = false;
    };

    defaultSopsFile = "${secretsDir}/sops-secrets.yaml";
    validateSopsFiles = false;

    secrets = {
      "github-key/private" = {};
    };
  };
  home.packages = with pkgs; [
    sops
    age
  ];
}