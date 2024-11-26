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
        /* Toolbar background color and text */
        #nav-bar, #TabsToolbar {
            background-color: rgb(0, 0, 0) !important;
            color: rgb(0, 255, 0) !important;
        }

        #nav-bar .toolbarbutton-text,
        #nav-bar .toolbarbutton-icon {
            color: rgb(0, 255, 0) !important;
        }

        /* Tab background and text */
        .tabbrowser-tab {
            background-color: rgb(0, 0, 0) !important;
            color: rgb(0, 255, 0) !important;
        }

        .tabbrowser-tab[selected] {
            background-color: rgb(0, 0, 0) !important;
            color: rgb(0, 255, 0) !important;
            border-bottom: 2px solid rgb(0, 255, 0) !important; /* tab_line equivalent */
        }

        /* Toolbar field (URL bar, search box) */
        #urlbar, #searchbar {
            background-color: rgb(0, 0, 0) !important;
            color: rgb(0, 255, 0) !important;
            border: 1px solid rgb(0, 0, 0) !important;
        }

        #urlbar:focus, #searchbar:focus {
            border-color: rgb(0, 0, 0) !important;
        }

        #urlbar input, #searchbar input {
            color: rgb(0, 255, 0) !important;
        }

        /* Popups (menus, dropdowns) */
        panel, .autocomplete-richlistbox {
            background-color: rgb(0, 0, 0) !important;
            color: rgb(0, 255, 0) !important;
            border: 1px solid rgb(0, 0, 0) !important;
        }

        panel[open], .autocomplete-richlistbox[selected] {
            background-color: rgba(0, 255, 0, 0.5) !important;
            color: rgb(0, 255, 0) !important;
        }

        /* Sidebar */
        #sidebar, #sidebar-header {
            background-color: rgb(0, 0, 0) !important;
            color: rgb(0, 255, 0) !important;
        }

        #sidebar-header {
            border-bottom: 1px solid rgb(0, 0, 0) !important;
        }

        #sidebar .tree-rows {
            background-color: rgb(0, 0, 0) !important;
            color: rgb(0, 255, 0) !important;
        }

        /* Buttons hover/active states */
        toolbarbutton:hover {
            background-color: rgb(0, 0, 0) !important;
        }

        toolbarbutton:active {
            background-color: rgba(0, 255, 0, 0.5) !important;
        }

        /* Toolbar separators */
        #nav-bar .toolbarseparator {
            background-color: rgb(0, 0, 0) !important;
        }
      '';
      userContent = ''
        /* "About" Pages */
        @-moz-document url(about:blank), url(about:newtab), url(about:home), url(about:privatebrowsing) {
          html:not(#ublock0-epicker), body, #newtab-customize-overlay {
            background-color: #000000 !important;
            color: #00FF00 !important;
          }
        
          .search-wrapper {
            display: none;
          }
        
          :root {
            scrollbar-width: none !important;
          }
        }
      '';
    };  
  };
}
