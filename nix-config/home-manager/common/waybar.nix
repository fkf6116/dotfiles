{ config, pkgs, ... }:

let
  waybarConfig = {
    "layer" = "top";
    "position" = "top";
    "height" = 30;
    "spacing" = 4;
    "margin-top" = 5;
    "margin-bottom" = 5;
    "margin-left" = 5;
    "margin-right" = 5;
    "modules-left" = [
      "sway/workspaces"
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
      "persistent_workspaces" = {
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
      "format" = "{name}";
      "sort-by-number" = true;
    };

    "sway/scratchpad" = {
      "format" = "{icon} {count}";
      "show-empty" = false;
      "format-icons" = [ "󰎆" "󰎇" ];
      "tooltip" = true;
      "tooltip-format" = "{app}: {title}";
    };

    "window" = {
      "max-length" = 50;
      "separate-outputs" = true;
    };

    "clock" = {
      "format" = "{:%H:%M}";
      "format-alt" = "{:%Y-%m-%d %H:%M}";
      "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
    };

    "idle_inhibitor" = {
      "format" = "{icon}";
      "format-icons" = {
        "activated" = "󰅶";
        "deactivated" = "󰾪";
      };
    };

    "pulseaudio" = {
      "format" = "{icon} {volume}%";
      "format-bluetooth" = "{icon} {volume}%";
      "format-muted" = "󰖁";
      "format-icons" = {
        "headphone" = "󰋋";
        "hands-free" = "󰋎";
        "headset" = "󰋎";
        "phone" = "󰏲";
        "portable" = "󰋊";
        "car" = "󰄋";
        "default" = [ "󰕿" "󰖀" "󰕾" ];
      };
      "on-click" = "pavucontrol";
    };

    "network" = {
      "format-wifi" = " {essid} ({signalStrength}%)";
      "format-ethernet" = " {ipaddr}/{cidr}";
      "format-linked" = " {ifname} (No IP)";
      "format-disconnected" = "⚠ Disconnected";
      "format-alt" = " {ifname}: {ipaddr}/{cidr}";
    };

    "cpu" = {
      "format" = "󰻠 {usage}%";
      "tooltip" = true;
    };

    "memory" = {
      "format" = "󱘭 {percentage}%";
      "tooltip-format" = "{used:0.1f}GB/{total:0.1f}GB used";
    };

    "temperature" = {
      "critical-threshold" = 80;
      "format" = " {icon} {temperatureC}°C";
      "format-icons" = [ "󰈸" "󰈹" "󰈺" ];
    };

    "battery" = {
      "states" = {
        "warning" = 30;
        "critical" = 15;
      };
      "format" = "{icon} {capacity}%";
      "format-charging" = "󰂄 {capacity}%";
      "format-plugged" = "󰂄 {capacity}%";
      "format-alt" = "{time} {icon}";
      "format-icons" = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
    };

    "backlight" = {
      "format" = " {percent}%";
      "format-icons" = [ "󰃞" "󰃟" "󰃠" "󰃡" "󰃢" "󰃣" "󰃤" "󰃥" "󰃦" ];
    };

    "tray" = {
      "icon-size" = 18;
      "spacing" = 10;
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
      background: rgba(21, 18, 27, 0.8);
      color: #cdd6f4;
      transition-property: background-color;
      transition-duration: .5s;
    }

    window#waybar.hidden {
      opacity: 0.2;
    }

    #window {
      font-weight: bold;
      font-family: "Ubuntu Sans";
    }

    #workspaces {
      padding: 0 5px;
    }

    #workspaces button {
      padding: 0 5px;
      color: #cdd6f4;
      border-radius: 8px;
      margin: 0 2px;
    }

    #workspaces button:hover {
      background: rgba(0, 0, 0, 0.2);
      box-shadow: inherit;
      text-shadow: inherit;
    }

    #workspaces button.active {
      background: #313244;
      color: #c9545d;
    }

    #workspaces button.urgent {
      background-color: #f38ba8;
    }

    #clock,
    #battery,
    #cpu,
    #memory,
    #temperature,
    #backlight,
    #network,
    #pulseaudio,
    #tray,
    #mode,
    #idle_inhibitor {
      padding: 0 10px;
      margin: 0 2px;
      color: #cdd6f4;
      border-radius: 8px;
    }

    #clock {
      font-weight: bold;
      background: #313244;
    }

    #battery {
      background: #313244;
    }

    #battery.charging, #battery.plugged {
      color: #a6e3a1;
    }

    #battery.critical:not(.charging) {
      background: #f38ba8;
      color: #cdd6f4;
      animation-name: blink;
      animation-duration: 0.5s;
      animation-timing-function: linear;
      animation-iteration-count: infinite;
      animation-direction: alternate;
    }

    #cpu {
      background: #313244;
    }

    #memory {
      background: #313244;
    }

    #temperature {
      background: #313244;
    }

    #temperature.critical {
      background: #f38ba8;
    }

    #backlight {
      background: #313244;
    }

    #network {
      background: #313244;
    }

    #network.disconnected {
      background: #f38ba8;
    }

    #pulseaudio {
      background: #313244;
    }

    #pulseaudio.muted {
      background: #313244;
      color: #cdd6f4;
    }

    #tray {
      background: #313244;
    }

    #idle_inhibitor {
      background: #313244;
    }

    #idle_inhibitor.activated {
      background: #cdd6f4;
      color: #1e1e2e;
    }

    @keyframes blink {
      to {
        background-color: #f38ba8;
        color: #cdd6f4;
      }
    }
  '';

in
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = waybarConfig;
    };
    style = waybarStyle;
  };
}
