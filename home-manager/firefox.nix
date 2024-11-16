{ inputs, ...}:{
  programs.firefox = {
    enable = true;
    profiles.spleen = {
      settings = {
        "extensions.autoDisableScopes" = 0;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [ 
        privacy-badger
        vimium
        sidebery
        ublock-origin
        darkreader
      ];
      userChrome = ''
        * {
          font-family: Iosevka Web, Consolas, Courier, monospace;
          --main-color: #000000;
          --secondary-color: #008000;
          border: none !important;
        }
        html,
        body {
          color: var(--secondary-color) !important;
          --tab-shadow-max-size: 0px !important;
          --tab-block-margin: 0px !important;
        }
        #sidebar-box,
        .sidebar-placesTree {
          background-color: var(--main-color) !important;
          color: var(--secondary-color) !important;
        }

        #customized-input:-moz-focusring {
          boreder-color: #008000 !important;
        }

        #urlbar:not(.hidden-focus)[focused="true"],
        .searchbar-textbox[focused="true"] {
          border-color: var(--secondary-color) !important;
        }

        #bookmarks-menu,
        tab {
          visibility: collapse;
        }

        .urlbarView {
          display: none !important;
        }

        #urlbar {
          font-size: 22px !important;
          color: var(--secondary-color) !important;
          font-family: Iosevka Web, Consolas, Courier, monospace;
          background-color: #000000;
        }

        #urlbar-input-container:focus {
          padding: 0 !important;
        }

        #searchbar {
          font-size: 22px !important;
          border: none !important;
          color: var(--secondary-color) !important;
        }

        #PersonalToolbar,
        #navigator-toolbox,
        #nav-bar-customization-target,
        #PanelUI-menu-button,
        #urlbar-background,
        #urlbar:focus,
        #urlbar-input {
          background-color: var(--main-color) !important;
          color: var(--secondary-color) !important;
        }

        #navigator-toolbox {
          border: none !important;
        }

        #TabsToolbar {
          visibility: collapse;
        }

        #sidebar-header {
          visibility: collapse !important;
        }

        #identity-box {
          background-color: var(--main-color) !important;
          margin: 0;
        }

        #import-button {
          display: none;
        }

        #PlacesToolbarItems toolbarbutton image {
          display: none !important;
        }

        #context-navigation,
        #context-savepage,
        #context-pocket,
        #context-sendpagetodevice,
        #context-selectall,
        #context-viewsource,
        #context-inspect-a11y,
        #context-sendlinktodevice,
        #context-openlinkinusercontext-menu,
        #context-bookmarklink,
        #context-savelink,
        #context-savelinktopocket,
        #context-sendlinktodevice,
        #context-searchselect,
        #context-sendimage,
        #context-print-selection {
          display: none !important;
        }

        #context_bookmarkTab,
        #context_moveTabOptions,
        #context_sendTabToDevice,
        #context_reopenInContainer,
        #context_selectAllTabs,
        #context_closeTabOptions {
          display: none !important;
        }

      '';
      userContent = ''
        @-moz-document url(about:blank), url(about:newtab), url(about:home), url(about:privatebrowsing {
          html:not(#ublock0-epicker), html:not(#ublock0-epicker) body, #newtab-customize-overlay {
            background-color: #000000 !important;
          }
          body {
            background-color: #000000 !important;
            foreground-color: #008000 !important;
          }

          .search-wrapper {
            display: none;
          }

          :root{
            scrollbar-width: none !important;
          }
        }
      '';
    };  
  };
}
