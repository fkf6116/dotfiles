{
  config,
  pkgs,
  ...
}: let
  waybarConfig = {
    layer = "top";
    position = "top";
    height = 30;
    spacing = 4;
    "margin-top" = 5;
    "margin-bottom" = 5;
    "margin-left" = 5;
    "margin-right" = 5;

    "modules-left" = [
      "sway/workspaces"
      "hyprland/workspaces"
      "sway/scratchpad"
      "window"
    ];
    "modules-center" = [
      "clock"
    ];
    "modules-right" = [
      "idle_inhibitor"
      "pulseaudio"
      "network"
      "cpu"
      "memory"
      "temperature"
      "battery"
      "backlight"
      "tray"
    ];

    "sway/workspaces" = {
      persistent_workspaces = {
        "1" = [];
        "2" = [];
        "3" = [];
        "4" = [];
        "5" = [];
        "6" = [];
        "7" = [];
        "8" = [];
        "9" = [];
        "10" = [];
      };
      format = "{name}";
      "sort-by-number" = true;
    };

    "sway/scratchpad" = {
      format = "{icon} {count}";
      "show-empty" = false;
      "format-icons" = ["󰎆" "󰎇"];
      tooltip = true;
      "tooltip-format" = "{app}: {title}";
    };

    "window" = {
      "max-length" = 50;
      "separate-outputs" = true;
    };

    clock = {
      format = "{:%H:%M}";
      "format-alt" = "{:%Y-%m-%d %H:%M}";
      "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
    };

    "idle_inhibitor" = {
      format = "{icon}";
      "format-icons" = {
        activated = "󰅶";
        deactivated = "󰾪";
      };
    };

    pulseaudio = {
      format = "{icon} {volume}%";
      "format-bluetooth" = "{icon} {volume}%";
      "format-muted" = "󰖁";
      "format-icons" = {
        headphone = "󰋋";
        "hands-free" = "󰋎";
        headset = "󰋎";
        phone = "󰏲";
        portable = "󰋊";
        car = "󰄋";
        default = ["󰕿" "󰖀" "󰕾"];
      };
      "on-click" = "pavucontrol";
    };

    network = {
      "format-wifi" = " {essid} ({signalStrength}%)";
      "format-ethernet" = " {ipaddr}/{cidr}";
      "format-linked" = " {ifname} (No IP)";
      "format-disconnected" = "⚠ Disconnected";
      "format-alt" = " {ifname}: {ipaddr}/{cidr}";
    };

    cpu = {
      format = "󰻠 {usage}%";
      tooltip = true;
    };
    memory = {
      format = "󱘭 {percentage}%";
      "tooltip-format" = "{used:0.1f}GB/{total:0.1f}GB used";
    };
    temperature = {
      critical-threshold = 80;
      format = " {icon} {temperatureC}°C";
      format-icons = ["󰈸" "󰈹" "󰈺"];
    };
    battery = {
      states = {
        warning = 30;
        critical = 15;
      };
      format = "{icon} {capacity}%";
      "format-charging" = "󰂄 {capacity}%";
      "format-plugged" = "󰂄 {capacity}%";
      "format-alt" = "{time} {icon}";
      "format-icons" = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
    };
    backlight = {
      format = " {percent}%";
      format-icons = ["󰃞" "󰃟" "󰃠" "󰃡" "󰃢" "󰃣" "󰃤" "󰃥" "󰃦"];
    };
    tray = {
      "icon-size" = 18;
      spacing = 10;
    };
  };

  waybarStyle = ''





    * {
       border: none;
       border-radius: 8px;
       font-family: "JetbrainsMono Nerd Font";
       font-size: 13px;
       min-height: 0;
     }

     window#waybar {
       background: rgba(21, 18, 27, 0.2); /* mostly transparent */
       transition-property: background-color;
       transition-duration: 0.5s;
     }

     window#waybar.hidden {
       opacity: 0.2;
     }

     #workspaces button {
       padding: 0 5px;
       border-radius: 8px;
       margin: 0 2px;
       background: rgba(0,0,0,0); /* transparent */
       color: #${config.lib.stylix.colors.base0E}; /* purple */
     }

     #workspaces button.active {
       background: #${config.lib.stylix.colors.base01};
       color: #${config.lib.stylix.colors.base0B}; /* green */
     }

     #clock {
       background: #${config.lib.stylix.colors.base01};
       color: #${config.lib.stylix.colors.base0C}; /* cyan */
       border-radius: 8px;
       padding: 4px 8px;
       margin: 4px;
     }

     #network {
       background: #${config.lib.stylix.colors.base01};
       color: #${config.lib.stylix.colors.base0D}; /* blue */
       border-radius: 8px;
       padding: 4px 8px;
       margin: 4px;
     }

     #cpu {
       background: #${config.lib.stylix.colors.base01};
       color: #${config.lib.stylix.colors.base08}; /* red */
       border-radius: 8px;
       padding: 4px 8px;
       margin: 4px;
     }

     #memory {
       background: #${config.lib.stylix.colors.base01};
       color: #${config.lib.stylix.colors.base0A}; /* yellow/green */
       border-radius: 8px;
       padding: 4px 8px;
       margin: 4px;
     }

     #temperature {
       background: #${config.lib.stylix.colors.base01};
       color: #${config.lib.stylix.colors.base09}; /* orange */
       border-radius: 8px;
       padding: 4px 8px;
       margin: 4px;
     }

     #battery {
       background: #${config.lib.stylix.colors.base01};
       color: #${config.lib.stylix.colors.base0B}; /* green */
       border-radius: 8px;
       padding: 4px 8px;
       margin: 4px;
     }

     #backlight {
       background: #${config.lib.stylix.colors.base01};
       color: #${config.lib.stylix.colors.base0A};
       border-radius: 8px;
       padding: 4px 8px;
       margin: 4px;
     }

     #pulseaudio {
       background: #${config.lib.stylix.colors.base01};
       color: #${config.lib.stylix.colors.base0D};
       border-radius: 8px;
       padding: 4px 8px;
       margin: 4px;
     }

     #tray {
       background: #${config.lib.stylix.colors.base01};
       color: #${config.lib.stylix.colors.base05};
       border-radius: 8px;
       padding: 4px 8px;
       margin: 4px;
     }

     #idle_inhibitor {
       background: #${config.lib.stylix.colors.base01};
       color: #${config.lib.stylix.colors.base0C};
       border-radius: 8px;
       padding: 4px 8px;
       margin: 4px;
     }







  '';
in {
  programs.waybar = {
    enable = true;
    settings = {mainBar = waybarConfig;};
    style = waybarStyle;
  };
}
