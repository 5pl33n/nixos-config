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
          --secondary-color: #008000;
          border: none !important;
        }
        
        html, body {
          color: var(--secondary-color) !important;
        }
        
        /* Sidebar */
        #sidebar-box,
        .sidebar-placesTree {
          background-color: var(--main-color) !important;
          color: var(--secondary-color) !important;
          scrollbar-width: none;
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
        }
        
        #urlbar[focused="true"] > #urlbar-background,
        #urlbar-input-container {
          box-shadow: none !important;
          border: none solid transparent !important;
        }
        
        #urlbar-input-container:focus {
          padding: none !important;
        }
        
        #urlbar:not(.hidden-focus)[focused="true"],
        .searchbar-textbox[focused="true"],
        *:focus,
        *:focus-visible {
          border-color: #008000 !important;
          outline: none solid #008000 !important;
          outline-offset: none !important;
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
        
        /* Customizing Tabs Appearance */
        .tabbrowser-tab[visuallyselected="true"] > .tab-stack > .tab-background {
          box-shadow: none !important;
        }
        
        .tabbrowser-tab {
          border-right: 0 solid transparent !important;
          margin-left: -4px !important;
        }
        
        .tabbrowser-tab[last-visible-tab="true"] {
          padding-inline-end: 0 !important;
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
            color: #008000 !important;
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
