{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = 5;
        height = 24; 

        modules-left = ["cpu" "memory" "temperature"];
        modules-center = ["clock"];
        modules-right = ["wireplumber" "network" "battery"];

        "hyprland/workspaces" = {
          "all-outputs" = "true";
          "on-click" = "activate";
        };

        "cpu" = {
          "interval" = "10";
          "format" = " {usage}% ";
          "max-length" = "30";
        };

        "memory" = {
          "interval" = "30";
          "format" = "  {}%";
          "max-length" = "30";
        };

        "temperature" = {
          "format" = " {temperatureC}°C";
          "max-length" = "30";
        };

        "wireplumber" = {
          "format" = "{icon}  {volume}%";
          "format-muted" = " 󰖁  ";
          "format-icons" = {
            "default" = ["" "" ""];
          };
        };

        "network" = {
          "format-wifi" = "󰖩 {signalStrength}%";
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
          "format-charging" = " {capacity}%";
          "format-plugged" = " {capacity}%";
          "format-alt" = "{icon} {time}";
          "format-full" = " {capacity}%";
          "format-icons" = ["" "" "" "" ""];
        };

        "clock" = {
          "format" = "{:%d.%m | %H:%M}";
        };
      };
    };

    style = ''
      @define-color foreground #008000;
      @define-color foreground-inactive #8FBC8F;
      @define-color background #000000;

      * {
          font-family: "CaskaydiaCove Nerd Font";
          font-size: 16px;
          padding: 0;
          margin: 0;
      }

      #workspaces,
      #waybar {
          color: @foreground;
          background-color: @background;
      }

      #workspaces button {
          padding-left: 1em;
          padding-right: 1.3em;
      }

      #workspaces button.empty {
          color: @foreground-inactive;
      }

      #workspaces button.active {
          background-color: @background;
          border-radius: 3px;
      }

      #wireplumber,
      #bat,
      #tray,
      #usage,
      #net {
          border-radius: 3px;
          padding-left: 0.5em;
          padding-right: 0.5em;
          margin-left: 0.3em;
      }

      #battery,
      #memory,
      #language,
      #network {
          margin-right: 0.8em;
      }
    '';
  };
}
