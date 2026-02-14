{ config, pkgs,... }:

{

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = config.sops.secrets."github-key/private".path;
        addKeysToAgent = "yes";
      };
    };
  };
}
