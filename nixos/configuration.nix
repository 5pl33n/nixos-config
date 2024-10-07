{ inputs, pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
  ];
  environment.variables = {
    EDITOR = "nvim";
  };
  programs = {
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
      passwordAuthentication = true;
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
  security.rtkit.enable = true;
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
    };
    # boot.initrd.kernelModules = [ "amdgpu" ];
    kernelParams = [ "psmouse.synaptics_intertouch=0" ]; 
  };
  time.timeZone = "Europe/Rome";
  i18n.defaultLocale = "en_US.UTF-8";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "24.05";
}
