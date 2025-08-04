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
      "browser.toolbars.bookmarks.visibility" = "newtab";
      "browser.compactmode.show" = true;
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

      # "network.http.referer.XOriginPolicy" = 2;

      # "webgl.disables" = false;

      "middlemouse.paste" = false;

      "general.autoScroll" = true;

      # "pdfjs.defaultZoomValue" = 100;
    };
    profiles.default = {
      # CSS To make the top bar smaller
      # Based on: https://github.com/Zyox-zSys/SlimBarsFirefox
      userChrome = ''













 /* Source file https://github.com/MrOtherGuy/firefox-csshacks/tree/master/chrome/linux_gtk_window_control_patch.css made available under Mozilla Public License v. 2.0
See the above repository for updates as well as full license text. */

/* Overrides the appearance of the window controls with something that more closely matches "normal" buttons*/
/* More importantly, this makes window controls to respect layout rules the other styles rely on */

.titlebar-buttonbox{
  align-items: stretch !important;
}
.titlebar-button {
  -moz-appearance: none !important;
  -moz-context-properties: fill, stroke, fill-opacity;
  fill: currentColor;
  padding: 4px 6px !important;
  flex-grow: 1;
  overflow: clip;
}
.titlebar-button:hover{ background-color: rgba(0,0,0,0.1) }
.titlebar-min{ list-style-image: url(chrome://browser/skin/zoom-out.svg); }
.titlebar-close{
  list-style-image: url(chrome://global/skin/icons/close.svg);
  fill-opacity: 0;
  stroke: currentColor
}






/* Source file https://github.com/MrOtherGuy/firefox-csshacks/tree/master/chrome/navbar_below_content.css made available under Mozilla Public License v. 2.0
See the above repository for updates as well as full license text. */

/* Moves the main toolbar (#nav-bar) to the bottom of the window */

@-moz-document url(chrome://browser/content/browser.xhtml){

  :root:not([inFullscreen]){
    --uc-bottom-toolbar-height: calc(39px + var(--toolbarbutton-outer-padding) )
  }

  :root[uidensity="compact"]:not([inFullscreen]){
    --uc-bottom-toolbar-height: calc(32px + var(--toolbarbutton-outer-padding) )
  }

  #browser,
  #customization-container{ margin-bottom: var(--uc-bottom-toolbar-height,0px) }

  #nav-bar{
    position: fixed !important;
    bottom: 0px;
    /* For some reason -webkit-box behaves internally like -moz-box, but can be used with fixed position. display: flex would work too but it breaks extension menus. */
    display: -webkit-box;
    width: 100%;
    z-index: 1;
  }
  #nav-bar-customization-target{ -webkit-box-flex: 1; }
  
  :root[lwtheme] #nav-bar{
    background-image: linear-gradient(var(--toolbar-bgcolor),var(--toolbar-bgcolor)), var(--lwt-additional-images,var(--toolbar-bgimage)) !important;
    background-position: top,var(--lwt-background-alignment);
    background-repeat: repeat,var(--lwt-background-tiling);
  }
  :root[lwtheme-image] #nav-bar{
    background-image: linear-gradient(var(--toolbar-bgcolor),var(--toolbar-bgcolor)),var(--lwt-header-image), var(--lwt-additional-images,var(--toolbar-bgimage)) !important;
  }

  /* Fix panels sizing */
  .panel-viewstack{ max-height: unset !important; }

  #urlbar[breakout][breakout-extend]{
    display: flex !important;
    flex-direction: column-reverse !important;
    bottom: 0px !important; /* Change to 3-5 px if using compact_urlbar_megabar.css depending on toolbar density */
    top: auto !important;
  }

  .urlbarView-body-inner{ border-top-style: none !important; }
  
  @media (-moz-platform: linux){
    #notification-popup[side="top"]{
      margin-top: calc(-2 * var(--panel-padding-block) - 40px - 32px - 8.5em) !important;
    }
    #permission-popup[side="top"]{
      margin-top: calc(-2 * var(--panel-padding-block) - 2.5em);
    }
  }
}

/* custom */
#urlbar-searchmode-switcher {
  position: initial! important;
}
        '';
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
      BlockAboutConfig = false;
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
