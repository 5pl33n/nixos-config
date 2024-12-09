{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    firefox
    # CLI utils
    busybox
    upower
    vim
    tree
    wget
    git
    unzip
    cava
    zip
    brightnessctl
    openssl
    lazygit
    bluez
    bluez-tools
    # Wayland stuff
    xwayland
    wl-clipboard
    cliphist
    # WMs and stuff
    hyprland
    xdg-desktop-portal-hyprland
    waybar
    tofi
    # Screenshotting
    grim
    grimblast
    slurp
    flameshot
    swappy
    # Other
    home-manager
  ];
}
