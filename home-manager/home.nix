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
    tofi = {
      enable = true;
      settings = {
	background-color = "#000000";
	border-width = 0;
	font = "monospace";
	height = "100%";
	num-results = 5;
	outline-width = 0;
	padding-left = "35%";
	padding-top = "35%";
	result-spacing = 25;
	width = "100%";
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
