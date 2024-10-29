{ pkgs, ... }: {
  imports = [
    ./zsh.nix
    ./hyprland.nix
    ./waybar.nix
  ];

  home = {
    username = "spleen";
    homeDirectory = "/home/spleen";
    stateVersion = "24.05";
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
    nixvim = {
      enable = true;
      defaultEditor = true;
      colorschemes.modus = {
        enable = true;
        settings = {
          dim_inactive = false;
          hide_inactive_statusline = false;
          on_colors = "function(colors) end";
          on_highlights = "function(highlights, colors) end";
          style = "modus_vivendi";
          styles = {
            comments = {
              italic = true;
            };
            functions = { };
            keywords = {
              italic = true;
            };
            variables = { };
          };
          transparent = false;
          variant = "default";
        };
      };
      plugins.lualine.enable = true;
      opts = {
        number = true;
        relativenumber = true;
        shiftwidth = 2;
      };
    };

    tmux = {
      enable = true;
      extraConfig = ''
        set -g prefix ^A
        set -g base-index 1
        set -g detach-on-destroy off
        set -g escape-time 0
        set -g history-limit 1000000
        set -g renumber-windows on
        set -g set-clipboard on
        set -g status-position top
        set -g default-terminal "${TERM}"
        setw -g mode-keys vi
        unbind %
        bind | split-window -h
        bind - split-window -v
        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R
        bind -r H resize-pane -L 5
        bind -r J resize-pane -D 5
        bind -r K resize-pane -U 5
        bind -r L resize-pane -R 5
        unbind [
        bind Escape copy-mode
        unbind p
        bind p paste-buffer
        bind -t vi-copy 'v' begin-selection
        bind -t vi-copy 'y' copy-selection
        bind C-a send-prefix
        set -g status-right '#[fg=black,bg=color15] #{cpu_percentage}  %H:%M '
        run-shell ${pkgs.tmuxPlugins.cpu}/share/tmux-plugins/cpu/cpu.tmux
      '';
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

  qt = {
    enable = true;
    platformTheme = {
      name = "qtct";
    };
  };
}
