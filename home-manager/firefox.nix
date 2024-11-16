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
        }
        html,
        body {
          color: var(--secondary-color) !important;
          --tab-shadow-max-size: 0px !important;
          --tab-block-margin: 0px !important;
        }
        #bookmarks-menu,
        tab {
          visibility: collapse;
        }
        ::-moz-placeholder {
          color: red;
          opacity: 0 !important;
          display: none !important;
        }

        .tab-icon-image {
          display: none;
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

        #nav-bar {
          margin-top: 0 !important;
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

        .titlebar-close {
          list-style-image: url(https://cdn-icons-png.flaticon.com/512/14035/14035711.png) !important;
          padding: 0px !important;
          margin-left: 20px !important;
          margin-right: 20px !important;
        }

        .titlebar-max,
        .titlebar-restore {
          list-style-image: url(https://cdn-icons-png.flaticon.com/512/14035/14035769.png) !important;
          margin-left: 20px !important;
          padding: 0 !important;
        }

        .titlebar-min {
          -moz-default-appearance: -moz-window-button-maximize;
          list-style-image: url(img/yellow-circle.png) !important;
          padding: 0 !important;
        }

        .titlebar-button {
          & > .toolbarbutton-icon {
            width: 20px !important;
            height: 20px !important;
          }
        }

        .titlebar-button:hover {
          background-color: transparent !important;
          border-radius: 10px !important;
        }

        tab:is([visuallyselected], [multiselected]) {
          color: var(--secondary-color) !important;
          background-color: var(--main-color) !important;
        }

        :root:not(:-moz-lwtheme) {
          --tab-selected-bgcolor: rgba(20, 80, 20, 0.174) !important;
        }

        #import-button {
          display: none;
        }

        #PlacesToolbarItems toolbarbutton image {
          display: none !important;
        }

        toolbarbutton.bookmark-item:not(.subviewbutton) {
          &:not([disabled], [open]):hover {
            background-color: rgba(20, 80, 20, 0.174) !important;
          }
        }
      '';
      userContent = ''
        @-moz-document url(about:home), url(about:newtab), url(about:privatebrowsing) {
          body {
            background-color: #000000 !important;
            foreground-color: #008000 !important;
          }

          .search-wrapper {
            display: none;
          }
        }
      '';
    };  
  };
}
