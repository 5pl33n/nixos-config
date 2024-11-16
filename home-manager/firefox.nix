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

        #urlbar[focused='true'] > #urlbar-background {
          box-shadow: none !important;
        }

        #urlbar-input-container {
          border: 1px solid rgba(0, 0, 0, 0) !important;
        }

        #urlbar-container {
          margin-left: 0 !important;
        }

        #navigator-toolbox {
          border: none !important;
        }

        #urlbar:not(.hidden-focus)[focused="true"],
        .searchbar-textbox[focused="true"] {
          border-color: var(--secondary-color) !important;
        }

        *:focus,
        *:focus-visble {
          border-color: #008000 !important;
          outline: 3px solid #008000 !important;
          outline-offset: 3px !important;
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

        .tab-close-button {
          display: none;
        }

        .tabbrowser-tab:not([pinned]) .tab-icon-image {
          display: none !important;
        }

        #nav-bar:not([tabs-hidden='true']) {
          box-shadow: none !important;
        }

        #tabbrowser-tabs[haspinnedtabs]:not([positionpinnedtabs])
          > #tabbrowser-arrowscrollbox
          > .tabbrowser-tab[first-visible-unpinned-tab] {
          margin-inline-start: 0 !important;
        }

        :root {
          --toolbarbutton-border-radius: 0 !important;
          --toolbarbutton-color: #008000 !important;
          --tab-border-radius: 0 !important;
          --tab-block-margin: 0 !important;
        }

        .tab-background {
          border-right: 0px solid rgba(0, 0, 0, 0) !important;
          margin-left: -4px !important;
        }

        .tabbrowser-tab:is([visuallyselected='true'], [multiselected])
          > .tab-stack
          > .tab-background {
          box-shadow: none !important;
        }

        .tabbrowser-tab[last-visible-tab='true'] {
          padding-inline-end: 0 !important;
        }

        #tabs-newtab-button {
          padding-left: 0 !important;
        }

        /* Url Bar  */
        #urlbar-input-container {
          background-color: var(--sfsecondary) !important;
          border: 1px solid rgba(0, 0, 0, 0) !important;
        }

        #urlbar-container {
          margin-left: 0 !important;
        }

        #urlbar[focused='true'] > #urlbar-background {
          box-shadow: none !important;
        }

        #navigator-toolbox {
          border: none !important;
        }

        /* Bookmarks bar  */
        .bookmark-item .toolbarbutton-icon {
          display: none;
        }
        toolbarbutton.bookmark-item:not(.subviewbutton) {
          min-width: 1.6em;
        }

        /* Toolbar  */
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

        .urlbarView-url {
          color: #000000 !important;
        }

        /* Disable elements  */
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
