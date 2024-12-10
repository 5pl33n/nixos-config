{ inputs, config, pkgs, ...}: {
  imports = [
    /etc/nixos/hardware-configuration.nix
    ./packages.nix
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "CascadiaMono" "CascadiaCode" ]; })
  ];

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
      jack.enable = true;
    };
    upower.enable = true;
    displayManager = {
      enable = true;
      sddm = {
        enable = true;
        wayland.enable = true;
        settings = {
          Autologin = {
            Session = "hyprland.desktop";
            User = "spleen";
          };
        };
      };
    };
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
    initrd.luks.devices.cryptroot = {
      device = "/dev/disk/by-uuid/UUID-OF-SDA2";
      preLVM = true;
      allowDiscards = true;
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
      plugins = {
        lualine.enable = true;
        telescope = {
          enable = true;
        };
      };
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
  swapDevices = [{device = "/swapfile"; size = 10000;}];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "24.11";
}
