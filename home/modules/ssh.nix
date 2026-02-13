{ config, pkgs,... }:

{

  programs.ssh = {
    enable = true;
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
