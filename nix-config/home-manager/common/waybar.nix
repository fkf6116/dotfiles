{
  config,
  pkgs,
  ...
}: {
  # base00: "#191724"
  # base01: "#1f1d2e"
  # base02: "#26233a"
  # base03: "#6e6a86"
  # base04: "#908caa"
  # base05: "#e0def4"
  # base06: "#e0def4"
  # base07: "#524f67"
  # base08: "#eb6f92"
  # base09: "#f6c177"
  # base0A: "#ebbcba"
  # base0B: "#31748f"
  # base0C: "#9ccfd8"
  # base0D: "#c4a7e7"
  # base0E: "#f6c177"
  # base0F: "#524f67"

  programs.waybar = {
    enable = false;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        width = 1250;
        height = 40;
        margin-top = 8;
        spacing = 0;
        "modules-left" = [
          "custom/logo"
          "hyprland/workspaces"
          "hyprland/window"
          "hyprland/submap"
        ];
        "modules-center" = [
          "clock"
        ];
        "modules-right" = [
          "tray"
          "group/audio"
          "hyprland/language"
          "battery"
          "group/power"
        ];

        "custom/logo" = {
          format = "";
          tooltip = false;
          on-click = "pidof rofi || rofi -no-lazy-grab -show drun";
        };

        "hyprland/workspaces" = {
          all-outputs = true;
          disable-scroll = true;
          format = "{icon}";
          format-icons = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            default = "";
            # "1" = "";
            # "2" = "";
            # "3" = "";
            # "4" = "";
            # "5" = "";
            # "6" = "";
            # "7" = "";
            # "8" = "";
            # "9" = "";
            # default = "";
          };
        };

        "hyprland/window" = {
          format = "<span  weight='bold' >{class}</span>";
          max-length = 120;
          icon = false;
          separate-outputs = true;
        };

        "hyprland/submap" = {
          format = "[{}]";
          max-length = 8;
          tooltip = false;
        };

        battery = {
          format = "{icon}  {capacity}%";
          format-icons = [
            " "
            " "
            " "
            " "
            " "
          ];
        };

        "group/power" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 500;
            transition-left-to-right = true;
          };
          modules = [
            "custom/power" # First element is the "group leader" and won't ever be hidden
            "custom/quit"
            "custom/lock"
            "custom/reboot"
          ];
        };

        "custom/quit" = {
          format = "";
          tooltip = false;
          on-click = "hyprctl dispatch exit";
        };

        "custom/lock" = {
          format = "󰌾";
          tooltip = false;
          on-click = "swaylock";
        };

        "custom/reboot" = {
          format = "󰜉";
          tooltip = false;
          on-click = "reboot";
        };

        "custom/power" = {
          format = "󰐥";
          tooltip = false;
          on-click = "shutdown now";
        };

        "group/audio" = {
          orientation = "horizontal";
          drawer = {
            transition-duration = 600;
            children-class = "not-power";
            transition-to-left = true;
            click-to-reveal = false;
          };
          modules = [
            "pulseaudio"
            "pulseaudio/slider"
          ];
        };

        pulseaudio = {
          scroll-step = 5;
          format = "{icon}  {volume}%";
          format-bluetooth = "{icon}  {volume}%";
          format-muted = "muted  ";
          format-icons = {
            headphones = " ";
            handsfree = " ";
            headset = " ";
            phone = " ";
            portable = " ";
            car = "  ";
            default = [
              " "
              " "
            ];
          };
          on-click = "pavucontrol";
        };

        "pulseaudio/slider" = {
          min = 5;
          max = 100;
          rotate = 0;
          device = "pulseaudio";
          "scroll-step" = 1;
        };

        "hyprland/language" = {
          format = "   {}";
        };

        clock = {
          # timezone = "America/Argentina/Buenos_Aires";
          timezone = "Europe/Madrid";
          # not sure why you need to also change the order of this list to match
          timezones = [
            "Europe/Madrid"
            "America/Argentina/Buenos_Aires"
          ];
          format = "󰃭  {:%A, %d %B  %I:%M %p}";
          format-alt = "{%I:%M %p}";
          locale = "en_US.UTF-8";
          tooltip-format = "<tt>{calendar}</tt>";
          calendar = {
            mode = "month";
            "mode-mon-col" = 3;
            "on-scroll" = 1;
            "on-click-right" = "mode";
            "format" = {
              "months" = "<span color='#${config.lib.stylix.colors.base0A}'><b>{}</b></span>";
              "weekdays" = "<span color='#${config.lib.stylix.colors.base0E}'><b>{}</b></span>";
              "today" = "<span color='#${config.lib.stylix.colors.base08}'><b>{}</b></span>";
            };
          };
          "actions" = {
            "on-click-right" = "mode";
            "on-click-forward" = "tz_up";
            "on-click-backward" = "tz_down";
            "on-scroll-up" = "shift_up";
            "on-scroll-down" = "shift_down";
          };
        };

        tray = {
          show-passive-items = true;
          icon-size = 20;
          spacing = 5;
        };
      };
    };
    style = ''
      * {
        font-family: "DejaVu Sans", sans-serif;
        font-size: 12px;
        font-weight: bold;
        border-radius: 8px;
      }

      #workspaces button {
        padding: 2px 4px 2px 0px;
      }

      #workspaces button label {
        color: #${config.lib.stylix.colors.base0A};
      }

      #workspaces button.active label {
        color: #${config.lib.stylix.colors.base0B};
      }

      #custom-logo {
        font-size: 18px;
        margin-left: 7px;
        margin-right: 12px;
      }

      #clock {
        color: #${config.lib.stylix.colors.base08};
      }

      #custom-quit,
      #custom-lock,
      #custom-reboot,
      #custom-power {
        margin-left: 7px;
        margin-right: 12px;
        font-size: 18px;
      }

      #submap {
        color: #${config.lib.stylix.colors.base08};
      }

      #pulseaudio-slider trough {
        min-width: 90px;
        min-height: 10px;
      }

      .modules-left #workspaces button {
        border-bottom: 1px solid transparent;
      }
      .modules-left #workspaces button.focused,
      .modules-left #workspaces button.active {
        border-bottom: 1px solid transparent;
      }

      #battery {
        color: #${config.lib.stylix.colors.base09};
      }

      #pulseaudio {
        color: #${config.lib.stylix.colors.base0D};
      }

      #language {
        color: #${config.lib.stylix.colors.base0A};
      }
    '';
  };
}
# { config, pkgs, ... }:
#
# let
#   waybarConfig = {
#     "layer" = "top";
#     "position" = "top";
#     "height" = 30;
#     "spacing" = 4;
#     "margin-top" = 5;
#     "margin-bottom" = 5;
#     "margin-left" = 5;
#     "margin-right" = 5;
#     "modules-left" = [
#       "sway/workspaces"
#       "hyprland/workspaces"
#       "sway/scratchpad"
#       "window"
#     ];
#     "modules-center" = [
#       "clock"
#     ];
#     "modules-right" = [
#       "idle_inhibitor"
#       "pulseaudio"
#       "network"
#       "cpu"
#       "memory"
#       "temperature"
#       "battery"
#       "backlight"
#       "tray"
#     ];
#
#     "sway/workspaces" = {
#       "persistent_workspaces" = {
#         "1" = [ ];
#         "2" = [ ];
#         "3" = [ ];
#         "4" = [ ];
#         "5" = [ ];
#         "6" = [ ];
#         "7" = [ ];
#         "8" = [ ];
#         "9" = [ ];
#         "10" = [ ];
#       };
#       "format" = "{name}";
#       "sort-by-number" = true;
#     };
#
#     "sway/scratchpad" = {
#       "format" = "{icon} {count}";
#       "show-empty" = false;
#       "format-icons" = [
#         "󰎆"
#         "󰎇"
#       ];
#       "tooltip" = true;
#       "tooltip-format" = "{app}: {title}";
#     };
#
#     "window" = {
#       "max-length" = 50;
#       "separate-outputs" = true;
#     };
#
#     "clock" = {
#       "format" = "{:%H:%M}";
#       "format-alt" = "{:%Y-%m-%d %H:%M}";
#       "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
#     };
#
#     "idle_inhibitor" = {
#       "format" = "{icon}";
#       "format-icons" = {
#         "activated" = "󰅶";
#         "deactivated" = "󰾪";
#       };
#     };
#
#     "pulseaudio" = {
#       "format" = "{icon} {volume}%";
#       "format-bluetooth" = "{icon} {volume}%";
#       "format-muted" = "󰖁";
#       "format-icons" = {
#         "headphone" = "󰋋";
#         "hands-free" = "󰋎";
#         "headset" = "󰋎";
#         "phone" = "󰏲";
#         "portable" = "󰋊";
#         "car" = "󰄋";
#         "default" = [
#           "󰕿"
#           "󰖀"
#           "󰕾"
#         ];
#       };
#       "on-click" = "pavucontrol";
#     };
#
#     "network" = {
#       "format-wifi" = " {essid} ({signalStrength}%)";
#       "format-ethernet" = " {ipaddr}/{cidr}";
#       "format-linked" = " {ifname} (No IP)";
#       "format-disconnected" = "⚠ Disconnected";
#       "format-alt" = " {ifname}: {ipaddr}/{cidr}";
#     };
#
#     "cpu" = {
#       "format" = "󰻠 {usage}%";
#       "tooltip" = true;
#     };
#
#     "memory" = {
#       "format" = "󱘭 {percentage}%";
#       "tooltip-format" = "{used:0.1f}GB/{total:0.1f}GB used";
#     };
#
#     "temperature" = {
#       "critical-threshold" = 80;
#       "format" = " {icon} {temperatureC}°C";
#       "format-icons" = [
#         "󰈸"
#         "󰈹"
#         "󰈺"
#       ];
#     };
#
#     "battery" = {
#       "states" = {
#         "warning" = 30;
#         "critical" = 15;
#       };
#       "format" = "{icon} {capacity}%";
#       "format-charging" = "󰂄 {capacity}%";
#       "format-plugged" = "󰂄 {capacity}%";
#       "format-alt" = "{time} {icon}";
#       "format-icons" = [
#         "󰁺"
#         "󰁻"
#         "󰁼"
#         "󰁽"
#         "󰁾"
#         "󰁿"
#         "󰂀"
#         "󰂁"
#         "󰂂"
#         "󰁹"
#       ];
#     };
#
#     "backlight" = {
#       "format" = " {percent}%";
#       "format-icons" = [
#         "󰃞"
#         "󰃟"
#         "󰃠"
#         "󰃡"
#         "󰃢"
#         "󰃣"
#         "󰃤"
#         "󰃥"
#         "󰃦"
#       ];
#     };
#
#     "tray" = {
#       "icon-size" = 18;
#       "spacing" = 10;
#     };
#   };
#
#   waybarStyle = ''
#     * {
#       border: none;
#       border-radius: 8px;
#       font-family: "JetbrainsMono Nerd Font";
#       font-size: 13px;
#       min-height: 0;
#     }
#
#     window#waybar {
#       background: rgba(21, 18, 27, 0.8);
#       color: #cdd6f4;
#       transition-property: background-color;
#       transition-duration: .5s;
#     }
#
#     window#waybar.hidden {
#       opacity: 0.2;
#     }
#
#     #window {
#       font-weight: bold;
#       font-family: "Ubuntu Sans";
#     }
#
#     #workspaces {
#       padding: 0 5px;
#     }
#
#     #workspaces button {
#       padding: 0 5px;
#       color: #cdd6f4;
#       border-radius: 8px;
#       margin: 0 2px;
#     }
#
#     #workspaces button:hover {
#       background: rgba(0, 0, 0, 0.2);
#       box-shadow: inherit;
#       text-shadow: inherit;
#     }
#
#     #workspaces button.active {
#       background: #313244;
#       color: #c9545d;
#     }
#
#     #workspaces button.urgent {
#       background-color: #f38ba8;
#     }
#
#     #clock,
#     #battery,
#     #cpu,
#     #memory,
#     #temperature,
#     #backlight,
#     #network,
#     #pulseaudio,
#     #tray,
#     #mode,
#     #idle_inhibitor {
#       padding: 0 10px;
#       margin: 0 2px;
#       color: #cdd6f4;
#       border-radius: 8px;
#     }
#
#     #clock {
#       font-weight: bold;
#       background: #313244;
#     }
#
#     #battery {
#       background: #313244;
#     }
#
#     #battery.charging, #battery.plugged {
#       color: #a6e3a1;
#     }
#
#     #battery.critical:not(.charging) {
#       background: #f38ba8;
#       color: #cdd6f4;
#       animation-name: blink;
#       animation-duration: 0.5s;
#       animation-timing-function: linear;
#       animation-iteration-count: infinite;
#       animation-direction: alternate;
#     }
#
#     #cpu {
#       background: #313244;
#     }
#
#     #memory {
#       background: #313244;
#     }
#
#     #temperature {
#       background: #313244;
#     }
#
#     #temperature.critical {
#       background: #f38ba8;
#     }
#
#     #backlight {
#       background: #313244;
#     }
#
#     #network {
#       background: #313244;
#     }
#
#     #network.disconnected {
#       background: #f38ba8;
#     }
#
#     #pulseaudio {
#       background: #313244;
#     }
#
#     #pulseaudio.muted {
#       background: #313244;
#       color: #cdd6f4;
#     }
#
#     #tray {
#       background: #313244;
#     }
#
#     #idle_inhibitor {
#       background: #313244;
#     }
#
#     #idle_inhibitor.activated {
#       background: #cdd6f4;
#       color: #1e1e2e;
#     }
#
#     @keyframes blink {
#       to {
#         background-color: #f38ba8;
#         color: #cdd6f4;
#       }
#     }
#   '';
#
# in
# {
#   programs.waybar = {
#     enable = true;
#     settings = {
#       mainBar = waybarConfig;
#     };
#     style = waybarStyle;
#   };
# }

