{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        exclusive = true;
        passthrough = false;
        fixed-center = true;
        ipc = true;
        margin-top = 3;
        margin-left = 5;
        margin-right = 5;

        modules-left = [
          "custom/launcher"
          "hyprland/workspaces"
          "cpu"
          "temperature"
          "memory"
          "disk"
        ];

        modules-center = [
          # "clock"
        ];

        modules-right = [
          "hyprland/language"
          "network"
          "tray"
          "pulseaudio"
          "clock"
          # "pulseaudio#microphone"
        ];

        clock = {
          format = " {:%b %d %H:%M}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
        };

        cpu = {
          format = "󰍛 {usage}%";
          interval = 1;
        };

        "hyprland/language" = {
          format = " {short}";
        };

        network = {
          format-ethernet = "󰒢 Ethernet";
          format-disconnected = "󰌙 Disconnected";
          tooltip-format = "{ipaddr}  {bandwidthUpBits}  {bandwidthDownBits}";
          tooltip-format-disconnected = "󰌙 Disconnected";
        };

        "hyprland/workspaces" = {
          all-outputs = true;
          format = "{icon}";
          on-click = "activate";
          persistent-workspaces = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
            "5" = [ ];
          };
          format-icons = {
            # "default" = " ";
            # "default" = " ";
            "default" = " ";
            "active" = " ";
            "urgent" = " ";
            "inactive" = " ";
            # "urgent" = " ";
          };
        };

        disk = {
          interval = 30;
          path = "/";
          format = "󰋊 {percentage_used}%";
          tooltip-format = "{used} used out of {total} on {path} ({percentage_used}%)";
        };

        memory = {
          interval = 10;
          format = "󰾆 {used:0.1f}G";
          format-alt = "󰾆 {percentage}%";
          format-alt-click = "click";
          tooltip = true;
          tooltip-format = "{used:0.1f}GB/{total:0.1f}G";
          on-click-right = "kitty --title btop sh -c 'btop'";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "";
          format-icons = {
            default = [
              ""
              ""
              " "
            ];
          };
          on-click = "pamixer --toggle-mute";
          on-click-right = "pwvucontrol";
          on-scroll-up = "pamixer -i 5";
          on-scroll-down = "pamixer -d 5";
          scroll-step = 5;
          smooth-scrolling-threshold = 1;
          ignored-sinks = [ "Easy Effects Sink" ];
        };

        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = " {volume}%";
          format-source-muted = "";
          on-click = "pavucontrol";
          on-click-right = "pamixer --default-source -t";
          on-scroll-up = "pamixer --default-source -i 5";
          on-scroll-down = "pamixer --default-source -d 5";
        };

        temperature = {
          interval = 10;
          tooltip = false;
          hwmon-path = "/sys/class/hwmon/hwmon1/temp1_input";
          critical-threshold = 80;
          format-critical = "{icon} {temperatureC}°C";
          format = "󰈸 {temperatureC}°C";
        };

        tray = {
          spacing = 16;
        };

        "custom/launcher" = {
          format = " ";
        };

      };
    };

    style = ''
      * {
      	font-family: "Jetbrains Mono Nerd Font";
      	font-weight: bold;
      	min-height: 0;
      	font-size: 97%;
      	padding: 0px;
      	margin: 0px;
      	font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
      }

      window#waybar {
      	background: rgba(6, 6, 6, 0.8);
      	border-radius: 4px;
      	padding: 4px;
      	margin: 4px;
      }

      tooltip {
      	background: rgba(8, 8, 8, 0.9);
      	border-radius: 4px;
      	padding: 8px;
      	margin: 4px;
      }

      tooltip label {
      	color: #dfdfdf;
      	margin: 0px 8px;
      	padding: 4px;
      }

      #workspaces {
      	color: #dfdfdf;
      	padding: 4px 0;
      	margin: 0px 2px;
      	border-radius: 8px;
      }

      #workspaces button {
      	padding: 4px 6px;
      	margin: 0px 1px;
      	color: #6e738d;
      	border-radius: 4px;
      }

      #workspaces button.active {
      	color: #dfdfdf;
      	border-radius: 4px;
      }

      #workspaces button.focused {
      	color: #d8dee9;
      }

      #workspaces button.urgent {
      	color: #ed8796;
      	border-radius: 4px;
      }

      #workspaces button:hover {
      	color: #dfdfdf;
      	background: rgba(255, 255, 255, 0.05);
      	border-radius: 4px;
      }

      #clock,
      #cpu,
      #disk
      #language,
      #memory,
      #pulseaudio,
      #temperature,
      #tray,
      #network {
      	color: #dfdfdf;
      	padding: 4px 8px;
      	margin: 0px 2px;
      	border-radius: 8px;
      }

      #custom-launcher {
      	padding: 4px 8px;
      	margin: 0 0 0 8px;
      	border-radius: 8px;
      }

      #disk {
      	margin: 0 0 0 8px;
      }

      #clock {
      	color: #dfdfdf;
      	padding: 4px 10px;
      	margin: 0px 8px 0px 2px;
      	border-radius: 8px;
      }

      #temperature.critical {
      	background-color: #ff0000;
      	padding: 4px 10px;
      	margin: 0px 2px;
      	border-radius: 8px;
      }

      @keyframes blink {
      	to {
      		color: #000000;
      	}
      }

      #taskbar button.active {
      	background-color: #7f849c;
      	padding: 4px 8px;
      	margin: 0px 4px;
      	border-radius: 4px;
      }
      	'';
  };

  home.packages = with pkgs; [
    cava
  ];
}
