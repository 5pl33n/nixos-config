{ inputs, config, pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
  ];

  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

  environment.variables = {
    EDITOR = "nvim";
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
        tabstop = 2;
        expandtab = true;
      };
    }; 

    zsh.enable = true;
    hyprland.enable = true;
  };

  console.keyMap = "it";
  time.timeZone = "Europe/Rome";
  i18n.defaultLocale = "en_US.UTF-8";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "24.05";
}
