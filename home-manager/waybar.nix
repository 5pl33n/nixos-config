{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = "24"; 

        modules-left = ["cpu" "memory" "backlight"];
        modules-center = ["hyprland/workspaces"];
        modules-right = ["wireplumber" "network" "battery" "clock"];

        "hyprland/workspaces" = {
            "all-outputs" = "true";
            "on-click" = "activate";
        };

        "cpu" = {
          "interval" = "10";
          "format" = "  {usage}%";
          "max-length" = "10";
        };

        "memory" = {
          "interval" = "30";
          "format" = "  {}%";
          "max-length" = "10";
        };

        "backlight" = {
          "max-length" = "4";
          "format" = "{icon}  {percent}%";
          "format-icons" = ["" "" "" "" "" "" "" "" ""];
          "on-scroll-up" = "brightnessctl set 10%-";
          "on-scroll-down" = "brightnessctl set +10%";
        };


        "custom/dunst" = {
          "exec" = "~/.config/waybar/scripts/dunst.sh";
          "on-click" = "dunstctl set-paused toggle";
          "restart-interval" = "1";
          "tooltip" = "false";
        };

        "wireplumber" = {
          "format" = "{icon}  {volume}%";
          "format-muted" = " 󰖁 ";
          "format-icons" = {
            "default" = ["" "" ""];
          };
        };

        "network" = {
          "format-wifi" = "󰖩  {signalStrength}%";
          "format-ethernet" = " 󰈀  ";
          "format-disconnected" = "  ";
        };

        "battery" = {
          "bat" = "BAT0";
          "adapter" = "ADP0";
          "interval" = "60";
          "states" = {
            "warning" = "30";
            "critical" = "15";
          };
          "max-length" = "20";
          "format" = "{icon}  {capacity}%";
          "format-warning" = "{icon}  {capacity}%";
          "format-critical" = "{icon}  {capacity}%";
          "format-charging" = "  {capacity}%";
          "format-plugged" = "  {capacity}%";
          "format-alt" = "{icon}  {time}";
          "format-full" = "  {capacity}%";
          "format-icons" = ["" "" "" "" ""];
        };

        "clock" = {
          "format-alt" = "  {:%a %b %d}";
          "format" = "  {:%I:%M %p}";
        };
      };
    };
  
    style = ''
      @define-color rosewater #f5e0dc;
      @define-color flamingo #f2cdcd;
      @define-color pink #f5c2e7;
      @define-color mauve #cba6f7;
      @define-color red #f38ba8;
      @define-color maroon #eba0ac;
      @define-color peach #fab387;
      @define-color yellow #f9e2af;
      @define-color green #a6e3a1;
      @define-color teal #94e2d5;
      @define-color sky #89dceb;
      @define-color sapphire #74c7ec;
      @define-color blue #89b4fa;
      @define-color lavender #b4befe;
      @define-color text #cdd6f4;
      @define-color subtext1 #bac2de;
      @define-color subtext0 #a6adc8;
      @define-color overlay2 #9399b2;
      @define-color overlay1 #7f849c;
      @define-color overlay0 #6c7086;
      @define-color surface2 #585b70;
      @define-color surface1 #45475a;
      @define-color surface0 #313244;
      @define-color base #1e1e2e;
      @define-color mantle #181825;
      @define-color crust #11111b;

      * {
          font-family: "CaskaydiaCove Nerd Font";
          font-size: 14px;
          min-height: 0;
          border-radius: 0;
      }

      window#waybar {
          background-color: @base;
          color: @foreground;
      }

      #window {
          margin: 2px;
          padding-left: 8px;
          padding-right: 8px;
      }

      #workspaces button {
          color: @text;
          border-bottom: 2px solid @text;
      }

      #workspaces button:focus {
          color: @base;
      }

      #workspaces button.active {
          color: @red;
          border-bottom: 2px solid @red;
      }

      #workspaces,
      #network,
      #pipewire,
      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #wireplumber,
      #tray,
      #mode,
      #scratchpad {
          margin: 2px;
          padding-left: 4px;
          padding-right: 4px;
      }

      #clock {
          color: @maroon;
          border-bottom: 2px solid @maroon;
      }

      #clock.date {
          color: @mauve;
          border-bottom: 2px solid @mauve;
      }

      #wireplumber {
          color: @blue;
          border-bottom: 2px solid @blue;
      }

      #network {
          color: @yellow;
          border-bottom: 2px solid @yellow;
      }

      #cpu {
          color: @peach;
          border-bottom: 2px solid @peach;
      }

      #memory {
          color: @sky;
          border-bottom: 2px solid @sky;
      }

      #backlight {
          color: @lavander;
          border-bottom: 2px solid @lavander;
      }

      #battery {
          color: @green;
          border-bottom: 2px solid @green;
      }

      #custom-vpn {
          color: @lavender;
          border-radius: 15px;
          padding-left: 6px;
          padding-right: 6px;
      }
    '';
  };
}
