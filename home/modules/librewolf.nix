{
  config,
  pkgs,
  inputs,
  ...
}:

{
  programs.librewolf = {
    enable = true;
    settings = {
      "browser.urlbar.suggest.engines" = false;
      "browser.urlbar.suggest.openpage" = false;
      "browser.urlbar.suggest.topsites" = false;

      # "network.http.referer.XOriginPolicy" = 2;

      # "webgl.disables" = false;

      "middlemouse.paste" = false;

      "general.autoScroll" = true;

      # "pdfjs.defaultZoomValue" = 100;
    };
    profiles.default.extensions = {
    #   packages = with pkgs.nur.repos.rycee.firefox-addons; [
    #     ublock-origin
    #   ];
    #   settings."uBlock0@raymondhill.net".settings = {
    #     selectedFilterLists = [
    #       "ublock-filters"
    #       "ublock-badware"
    #       "ublock-privacy"
    #       "ublock-unbreak"
    #       "ublock-quick-fixes"
    #     ];
    #   };
    };
    policies = {
      BlockAboutConfig = true;
      DefaultDownloadDirectory = "\${home}/Downloads";
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          default_area = "menupanel";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
      };
    };
  };
}
