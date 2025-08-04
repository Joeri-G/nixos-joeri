{
  config,
  pkgs,
  inputs,
  ...
}:

{
  programs.librewolf = {
    enable = true;
    # browser settings
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
    profiles.default = {
      # Search config
      search = {
        default = "ddgnjs";
        engines = {
          ddg-no-js = {
            definedAliases = [ "@ddgnjs" ];
            description = "Search DuckDuckGo without JS";
            iconMapObj."16" = "https://duckduckgo.com/favicon.ico";
            name = "DuckDuckGo No JS";
            urls = [{ template = "https://html.duckduckgo.com/html/?q={searchTerms}"; }];
          };
          nix-packages = {
            definedAliases = [ "@np" ];
            description = "Search in NixOS Packages";
            iconMapObj."16" = "https://nixos.org/favicon.png";
            name = "NixOS Packages";
            urls = [{ template = "https://search.nixos.org/packages?from=0&size=200&sort=relevance&type=packages&query={searchTerms}"; }];
          };
          nix-options = {
            definedAliases = [ "@no" ];
            description = "Search in NixOS Options";
            iconMapObj."16" = "https://nixos.org/favicon.png";
            name = "NixOS Options";
            urls = [{ template = "https://search.nixos.org/options?from=0&size=200&sort=relevance&type=packages&query={searchTerms}"; }];
          };
          home-manager = {
            definedAliases = [ "@ho" ];
            description = "Search in Home-Manager Options";
            iconMapObj."16" = "https://home-manager-options.extranix.com/images/favicon.png";
            name = "Home-Manager Options";
            urls = [{ template = "https://home-manager-options.extranix.com/?query={searchTerms}&release=release-25.05"; }];
          };
        };
      };
      # Extension settings!
      extensions = {
        force = true;
        settings."uBlock0@raymondhill.net".settings = {
          selectedFilterLists = [
            "ublock-filters"
            "ublock-badware"
            "ublock-privacy"
            "ublock-unbreak"
            "ublock-quick-fixes"
          ];
        };
      };
    };
    policies = {
      BlockAboutConfig = true;
      DisableTelemetry = true;
      DefaultDownloadDirectory = "\${home}/Downloads";
      # Extension list
      ExtensionSettings = with builtins;
        let extension = shortId: uuid: {
          name = uuid;
          value = {
            install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
            installation_mode = "normal_installed";
          };
        };
        in listToAttrs [
          (extension "ublock-origin" "uBlock0@raymondhill.net")
          (extension "tabliss" "extension@tabliss.io")
          (extension "libredirect" "7esoorv3@alefvanoon.anonaddy.me")
          (extension "clearurls" "{74145f27-f039-47ce-a470-a662b129930a}")
          (extension "tab-session-manager" "Tab-Session-Manager@sienori")
          (extension "canvasblocker" "CanvasBlocker@kkapsner.de")
          (extension "darkreader" "addon@darkreader.org")
          (extension "disconnect" "2.0@disconnect.me")
          (extension "iamge-search-options" "{4a313247-8330-4a81-948e-b79936516f78}")
          (extension "leechblock-ng" "leechblockng@proginosko.com")
          (extension "noscript" "{73a6fe31-595d-460b-a920-fcc0f8843232}")
        ];
        # To add additional extensions, find it on addons.mozilla.org, find
        # the short ID in the url (like https://addons.mozilla.org/en-US/firefox/addon/!SHORT_ID!/)
        # Then, download the XPI by filling it in to the install_url template, unzip it,
        # run `jq .browser_specific_settings.gecko.id manifest.json` or
        # `jq .applications.gecko.id manifest.json` to get the UUID
    };
  };
}
