{ pkgs, inputs, ... }:{
  imports = [
    ./zsh.nix
    ./hyprland.nix
    ./waybar.nix
    ./firefox.nix
  ];

  home = {
    username = "spleen";
    homeDirectory = "/home/spleen";
    stateVersion = "24.11";
    pointerCursor = {
      package = pkgs.phinger-cursors;
      name = "phinger-cursors-dark";
      size = 24;
      gtk.enable = true;
      x11 = {
        enable = true;
        defaultCursor = true;
      };
    };
  };

  programs = {
    tmux = {
      enable = true;
      terminal = "xterm-256color";
      shortcut = "a";
      baseIndex = 1;
      escapeTime = 0;
      clock24 = true;
      historyLimit = 10000;
      keyMode = "vi";
      plugins = with pkgs.tmuxPlugins; [
      ];
      extraConfig = ''
        set -g status-bg "#000000"
        set -g status-fg "#00FF00"
        set -g renumber-windows on
        set -g set-clipboard on
      '';
    };

    alacritty = {
      enable = true;
      settings = {
        colors.primary.background = "#000000";
        selection.save_to_clipboard = true;
      };
    };

    tofi = {
      enable = true;
      settings = {
        width = "100%";
        height = "100%";
        border-width = 0;
        outline-width = 0;
        padding-left = "35%";
        padding-top = "35%";
        prompt-text = " ";
        result-spacing = 25;
        num-results = 5;
        font = "monospace";
        background-color = "#000A";
      };
    };

    git = {
      enable = true;
      userName  = "5pl33n";
      userEmail = "luca.bragante@gmail.com";
    };

    htop = {
      enable = true;
      settings = {
        tree_view = 1;
      };
    };
  };

  gtk = {
    enable = true;
    gtk3.extraCss = ''
      * {
        background-color: #000000;
        color: #00FF00;
        border: none !important;
        outline: none !important;
        -gtk-icon-palette: #00FF00;
        box-shadow: none;
      }
    '';
    gtk4.extraCss = ''
      * {
        background-color: #000000;
        color: #00FF00;
        border: none !important;
        outline: none !important;
        -gtk-icon-palette: #00FF00;
        box-shadow: none;
      }
    '';
  };

  qt = {
    enable = true;
    platformTheme = {
      name = "gtk";
    };
  };
}
