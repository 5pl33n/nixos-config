{ config, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases =
      let
        flakeDir = "~/nixos-config/";
      in {
      rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
      upd = "nix flake update --flake ${flakeDir}";
      upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";
      hms = "home-manager switch --flake ${flakeDir}";
      conf = "nvim ${flakeDir}/nixos/configuration.nix";
      pkgs = "nvim ${flakeDir}/nixos/packages.nix";
       l = "eza -lh  --icons=auto";
       ls = "eza -1   --icons=auto";
       ll = "eza -lha --icons=auto --sort=name --group-directories-first";
       ld = "eza -lhD --icons=auto";
       ".." = "cd ..";
       "..." = "cd ../..";
       ".3" = "cd ../../..";
       ".4" = "cd ../../../..";
       ".5" = "cd ../../../../..";
       mkdir = "mkdir -p";
    };
    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";
    prezto = {
      enable = true;
      pmodules = [
        "environment"
        "utility"
        "archive"
        "completion"
        "directory"
        "fasd"
        "git"
        "python"
        "syntax-highlighting"
        "prompt"
        "history"
        "history-substring-search"
        "autosuggestions"
        "tmux"
        "docker"
        "editor"
      ];
      caseSensitive = false;
      prompt.theme = "nicoulaj";
      editor.keymap = "vi";
      syntaxHighlighting = {
        highlighters = [ "line" "pattern"];
        styles = {
          line = "fg=#00FF00";
        };
        pattern = {
          "rm*-rf*" = "bold,fg=red";
        };
      };
      tmux = {
        autoStartLocal = true;
        defaultSessionName = "jackdow";
      };
      python = {
        virtualenvInitialize = true;
        virtualenvAutoSwitch = true;
      };
    };
    initExtra = ''
    '';
  };
}
