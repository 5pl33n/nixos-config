{ pkgs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      "$mainMod" = "SUPER";

      monitor = [ "eDP-1,1920x1080@60,0x0,1,bitdepth,10" "HDMI-A-1,1920x1080@60,1920x0,1,bitdepth,10" ];

      env = [
        "XCURSOR_SIZE,24"
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "QT_QPA_PLATFORM,wayland;xcb"
        "GDK_BACKEND,wayland"
        "SDL_VIDEODIRIVER,wayland"
        "CLUTTER_BACKEND,wayland"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "XDG_CONFIG_HOME,/home/spleen/.config"
        "GTK_THEME,Catppuccin-Mocha"
        "GTK2_RC_FILES,/home/spleen/.themes/Catppuccin-Mocha/gtk-2.0/gtkrc"
      ];

      debug = {
        disable_logs = false;
        enable_stdout_logs = true;
      };

      input = {
        kb_layout = "it";
        follow_mouse = 1;
        sensitivity = 0.5;
        kb_options = "caps:swapescape";
        touchpad = {
          disable_while_typing = true;
          natural_scroll = true;
        };
      };

      general = {
        layout = "dwindle";
        gaps_in = 0;
        gaps_out = 0;
        gaps_workspaces = 0;
        border_size = 0;
        resize_on_border = true;
      };

      decoration = {
        rounding = 0;
        drop_shadow = false; 
        blur = {
            enabled = false;
        };
      };

      animations = {
        enabled = false;
      };

      gestures = {
        workspace_swipe = false;
      };

      misc = {
        force_default_wallpaper = 1;
        disable_hyprland_logo = true;
        background_color = "0x00000000";
      };

      windowrule = [
        # xwayland
        "opacity 0.0 override,class:^(xwaylandvideobridge)$"
        "noanim,class:^(xwaylandvideobridge)$"
        "noinitialfocus,class:^(xwaylandvideobridge)$"
        "maxsize 1 1,class:^(xwaylandvideobridge)$"
        "noblur,class:^(xwaylandvideobridge)$"
      ];

      exec-once = [
        "${pkgs.waybar}/bin/waybar"
        "dunst"
        "blueman-applet"
        "/usr/lib/polkit-kde-authentication-agent-1"
        "~/.config/hypr/scripts/xdph.sh"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'"
      ];

      bind = [
        "$mainMod, T, exec, alacritty"
        "$mainMod, Q, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, W, togglefloating,"
        "$mainMod, R, exec, $menu"
        "$mainMod, J, togglesplit,"
        "$mainMod, F, exec, firefox"
        "$mainMod, L, exec, swaylock"
        "$mainMod, A, exec, tofi-drun --drun-launch=true"
        "$mainMod, backspace, exec, wlogout -b 6 -c 0 -r 0 -m 0 --protocol layer-shell"
        "$mainMod, V, exec, cliphist list | tofi | cliphist decode | wl-copy"
        "ALT, return, fullscreen,"
        "$mainMod, J, togglesplit,"

        # Screenshot/Screencapture
        "$mainMod, P, exec, ~/.config/hypr/scripts/screenshot.sh s # drag to snip an area / click on a window to print it"
        "$mainMod CTRL, P, exec, ~/.config/hypr/scripts/screenshot.sh sf # frozen screen, drag to snip an area / click on a window to print it"
        "$mainMod ALT, P, exec, ~/.config/hypr/scripts/screenshot.sh m # print focused monitor"
        ",print, exec, ~/.config/hypr/scripts/screenshot.sh p  # print all monitor outputs"

        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Example special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
        "$mainMod ALT, S, movetoworkspacesilent, special"

        # Move window silently to workspace Super + Alt + [0-9]
        "$mainMod ALT, 1, movetoworkspacesilent, 1"
        "$mainMod ALT, 2, movetoworkspacesilent, 2"
        "$mainMod ALT, 3, movetoworkspacesilent, 3"
        "$mainMod ALT, 4, movetoworkspacesilent, 4"
        "$mainMod ALT, 5, movetoworkspacesilent, 5"
        "$mainMod ALT, 6, movetoworkspacesilent, 6"
        "$mainMod ALT, 7, movetoworkspacesilent, 7"
        "$mainMod ALT, 8, movetoworkspacesilent, 8"
        "$mainMod ALT, 9, movetoworkspacesilent, 9"
        "$mainMod ALT, 0, movetoworkspacesilent, 10"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      binde = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];

      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      bindel = [
        ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      ];
    };
  };
}
