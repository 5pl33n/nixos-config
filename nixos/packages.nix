{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [

    # CLI utils
    tree
    wget
    git
    htop
    unzip
    cava
    zip
    brightnessctl
    openssl
    lazygit
    bluez
    bluez-tools

    # GUI utils

    # Wayland stuff
    xwayland
    wl-clipboard
    cliphist

    # WMs and stuff
    hyprland
    xdg-desktop-portal-hyprland
    polybar
    waybar

    # Sound

    # Screenshotting
    grim
    grimblast
    slurp
    flameshot
    swappy

    # Other
    home-manager
  ];


  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "CascadiaMono" "CascadiaCode" ]; })
  ];

}
