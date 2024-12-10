{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    busybox
    upower
    vim
    tree
    wget
    git
    unzip
    zip
    # Wayland stuff
    xwayland
    wl-clipboard
    # WMs and stuff
    hyprland
    xdg-desktop-portal-hyprland
  ];
}
