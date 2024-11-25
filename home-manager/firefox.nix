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
        /* Global Styles */
        * {
          font-family: Iosevka Web, Consolas, Courier, monospace;
          --main-color: #000000;
          --secondary-color: #00FF00;
          color: var(--secondary-color) !important;
          border: none !important;
          outline: none !important;
          box-shadow: none !important;
        }
        
        html, body {
          color: var(--secondary-color) !important;
          border: none !important;
          margin: 0 !important;
          padding: 0 !important;
          outline: 1px solid #00FF00 !important;
          box-shadow: none !important;
        }
        
        /* Sidebar */
        #sidebar,
        #sidebar-splitter,
        #sidebar-box,
        #main-window,
        .sidebar-placesTree {
          background-color: var(--main-color) !important;
          color: var(--secondary-color) !important;
          scrollbar-color: #00FF00 #000000 !important;
          scrollbar-width: thin;
          border: none !important;
          margin: 0 !important;
          padding: 0 !important;
          box-shadow: none !important;
        }
        
        /* Url Bar */
        #urlbar {
          font-size: 22px !important;
          color: var(--secondary-color) !important;
          font-family: Iosevka Web, Consolas, Courier, monospace;
          background-color: var(--main-color) !important;
          box-shadow: none !important;
          padding: none !important;
          border: none !important;
          outline: none !important;
        }
        
        #urlbar[focused="true"] > #urlbar-background,
        #urlbar-input-container {
          box-shadow: none !important;
          padding: none !important;
          border: none !important;
          outline: none !important;
        }
        
        #urlbar-input-container:focus {
          padding: none !important;
          box-shadow: none !important;
          border: none !important;
          outline: none !important;
        }
        
        #urlbar:not(.hidden-focus)[focused="true"],
        .searchbar-textbox[focused="true"],
        *:focus,
        *:focus-visible {
          border: none !important;
          box-shadow: none !important;
          outline: none !important;
          outline-offset: none !important;
        }

        /* Text Boxes */
        textarea,
        input[type="text"],
        input[type="search"],
        input[type="password"],
        select {
          background-color: var(--main-color) !important;
          color: var(--secondary-color) !important;
          border: 1px solid var(--secondary-color) !important;
        }

        /* Menus and Dropdowns */

        menuitem:hover,
        menupopup > menu:hover,
        menupopup > menucaption:hover  {
          background-color: var(--main-color) !important;
          color: var(--secondary-color) !important;
          border: none !important;
        }

        #appMenu-popup toolbarbutton.subviewbutton:not([disabled],
        [open],
        :active):is(:hover) {
          background-color: var(--main-color) !important;
          color: var(--secondary-color) !important;
          border: none !important;
        }

        /* Focused and Active States */
        *:focus,
        *:active {
          outline: 1px solid var(--secondary-color) !important;
          outline-offset: 1px;
        }

        /* General Toolbar */
        #navigator-toolbox,
        #urlbar-container {
          margin-left: 0 !important;
          border: none !important;
        }
        
        #PersonalToolbar,
        #navigator-toolbox,
        #nav-bar-customization-target,
        #PanelUI-menu-button,
        #urlbar-background,
        #urlbar-input {
          background-color: var(--main-color) !important;
          color: var(--secondary-color) !important;
        }
        
        /* Tabs and Toolbar Elements */
        #TabsToolbar,
        #sidebar-header,
        #tracking-protection-icon-container,
        #urlbar-zoom-button,
        #star-button-box,
        #pageActionButton,
        #pageActionSeparator,
        #tabs-newtab-button,
        #back-button,
        #PanelUI-button,
        #forward-button,
        .tab-secondary-label {
          display: none !important;
        }
        
        .tabbrowser-tab:not([pinned]) .tab-icon-image,
        .tab-close-button {
          display: none !important;
        }
        
        /* Disable Context Menu Items */
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
        #context-print-selection,
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
