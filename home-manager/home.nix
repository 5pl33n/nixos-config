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
      package = pkgs.vanilla-dmz;
      name = "Vanilla-DMZ";
      size = 24;
      gtk.enable = true;
      x11 = {
        enable = true;
        defaultCursor = true;
      };
    };
  };

  programs = {
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
