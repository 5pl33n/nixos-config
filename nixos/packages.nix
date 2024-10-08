{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };
  environment.systemPackages = with pkgs; [
    kitty
    spaceship-prompt
    firefox
    nyxt
    # CLI utils
    vim
    tree
    eza
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
    # Wayland stuff
    xwayland
    wl-clipboard
    cliphist
    # WMs and stuff
    hyprland
    xdg-desktop-portal-hyprland
    waybar
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
