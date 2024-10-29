{ inputs, pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
  ];
  environment.variables = {
    EDITOR = "nvim";
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
    zsh.enable = true;
    hyprland.enable = true;
  };

  users = {
    defaultUserShell = pkgs.zsh;
    users.spleen = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" "input" "libvirtd" ];
      packages = with pkgs; [];
    };
  };
  services = {
    openssh = {
      enable = true;
      settings.PasswordAuthentication = true;
    };
    xserver = {
      xkb.layout = "it";
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;
    };
    upower.enable = true;
    blueman.enable = true;
    getty.autologinUser = "spleen";
  };
  networking ={
    hostName = "jackdow";
    networkmanager.enable = true;
  };
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
      };
    };
  };
  security = {
    rtkit.enable = true;
    sudo.wheelNeedsPassword = false;
  };
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
    };
    # boot.initrd.kernelModules = [ "amdgpu" ];
    kernelParams = [ "psmouse.synaptics_intertouch=0" ]; 
  };
  console.keyMap = "it";
  time.timeZone = "Europe/Rome";
  i18n.defaultLocale = "en_US.UTF-8";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "24.05";
}
