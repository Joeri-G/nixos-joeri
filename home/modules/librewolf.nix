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

      "privacy.resistFingerprinting" = false;
      "privacy.fingerprintingProtection" = true;
      "privacy.fingerprintingProtection.overrides.AllTargets" = true;
      "privacy.fingerprintingProtection.overrides.JSDateTimeUTC" = true;
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

        /*** Proton Tabs Tweaks ***/

        /* Adjust tab corner shape, optionally remove space below tabs */

        #tabbrowser-tabs {
            --user-tab-rounding: 6px;
        }

        .tab-background {
            border-radius: var(--user-tab-rounding) var(--user-tab-rounding) 0px 0px !important; /* Connected */
            margin-block: 1px 0 !important; /* Connected */
        }
        #scrollbutton-up, #scrollbutton-down { /* 6/10/2021 */
            border-top-width: 1px !important;
            border-bottom-width: 0 !important;
        }

        /* 1/16/2022 Tone down the Fx96 tab border with add-on themes in certain fallback situations */
        .tab-background:is([selected], [multiselected]):-moz-lwtheme {
            --lwt-tabs-border-color: rgba(0, 0, 0, 0.5) !important;
            border-bottom-color: transparent !important;
        }
        [brighttext="true"] .tab-background:is([selected], [multiselected]):-moz-lwtheme {
            --lwt-tabs-border-color: rgba(255, 255, 255, 0.5) !important;
            border-bottom-color: transparent !important;
        }

        /* Container color bar visibility */
        .tabbrowser-tab[usercontextid] > .tab-stack > .tab-background > .tab-context-line {
            margin: 0px max(calc(var(--user-tab-rounding) - 3px), 0px) !important;
        }

        /* Override Normal Density height to Compact Density height only for tabs */

        #TabsToolbar, #tabbrowser-tabs {
            --tab-min-height: 29px !important;
        }
            /* Tweak for covering a line at the bottom of the active tab on some themes 8/11/2021 */
        #main-window[sizemode="normal"] #toolbar-menubar[autohide="true"] + #TabsToolbar, 
        #main-window[sizemode="normal"] #toolbar-menubar[autohide="true"] + #TabsToolbar #tabbrowser-tabs {
            --tab-min-height: 30px !important;
        }
        #scrollbutton-up,
        #scrollbutton-down {
            border-top-width: 0 !important;
            border-bottom-width: 0 !important;
        }

            /* [Connected Tabs] Set a max height based on min-height plus margin-block: 1px 0 */
        #TabsToolbar, #TabsToolbar > hbox, #TabsToolbar-customization-target, #tabbrowser-arrowscrollbox  {
            max-height: calc(var(--tab-min-height) + 1px) !important;
        }
            /* [Connected Tabs] Adjust padding around icons on buttons to avoid crushed images */
        #TabsToolbar-customization-target toolbarbutton > .toolbarbutton-icon, 
        #TabsToolbar-customization-target .toolbarbutton-text, 
        #TabsToolbar-customization-target .toolbarbutton-badge-stack,
        #scrollbutton-up,#scrollbutton-down {
            padding-top: 7px !important;
            padding-bottom: 6px !important;
        }
            /* [Connected Tabs] Make sure tab attention dot isn't too high - 10 Dec 2022 */
        .tabbrowser-tab:is([image], [pinned]) > .tab-stack > .tab-content[attention]:not([selected="true"]),
        .tabbrowser-tab > .tab-stack > .tab-content[pinned][titlechanged]:not([selected="true"]),
        #firefox-view-button[attention], .webextension-browser-action[attention="true"] {
          background-position-y: bottom 2px !important;
        }

        /* Tweak Options as of 12/10/2022; Generated Mon Aug 04 2025 13:59:07 GMT+0000 (Greenwich Mean Time) */


        /* custom */
        #urlbar-searchmode-switcher {
          position: initial! important;
        }
        '';
      # Search config
      search = {
        default = "ddgnjs";
        force = true;
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
          (extension "proton-pass" "78272b6fa58f4a1abaac99321d503a20@proton.me")
          (extension "youtube-shorts-block" "{34daeb50-c2d2-4f14-886a-7160b24d66a4}")
        ];
        # To add additional extensions, find it on addons.mozilla.org, find
        # the short ID in the url (like https://addons.mozilla.org/en-US/firefox/addon/!SHORT_ID!/)
        # Then, download the XPI by filling it in to the install_url template, unzip it,
        # run `jq .browser_specific_settings.gecko.id manifest.json` or
        # `jq .applications.gecko.id manifest.json` to get the UUID
    };
  };
}
