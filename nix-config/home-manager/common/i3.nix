{ config, lib, pkgs, ... }:

let 
  mod = "Mod4";
  term = "kitty";
  app-menu = "rofi -show drun";
in {
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      modifier = mod;
      defaultWorkspace = "1";

      bars = [ ];

      gaps = {
        inner = 15;
        outer = 0;
      };

      keybindings = lib.mkOptionDefault {
        "${mod}+Return" = "exec ${term}";
        "${mod}+d" = "exec ${app-menu}";
        "${mod}+q" = "kill";
        "${mod}+Shift+c" = "reload";
        
        # Screenshot
        "${mod}+Shift+s" = "exec sh -c '${pkgs.maim}/bin/maim -s | xclip -selection clipboard -t image/png'";
        
        # Focus
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";
        
        # Move
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";
        
        # Layout
        "${mod}+b" = "splith";
        "${mod}+v" = "splitv";
        "${mod}+s" = "layout stacking";
        "${mod}+w" = "layout tabbed";
        "${mod}+e" = "layout toggle split";
        
        # Fullscreen
        "${mod}+f" = "fullscreen";
        
        # Floating
        "${mod}+Shift+space" = "floating toggle";
        "${mod}+space" = "focus mode_toggle";
        
        # Scratchpad
        "${mod}+Shift+minus" = "move scratchpad";
        "${mod}+minus" = "scratchpad show";
        
        # Resize mode
        "${mod}+r" = "mode resize";
        
        # Audio controls
        "${mod}+period" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
        "${mod}+comma" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
        "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
        "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
        "XF86AudioMute" = "exec set-volume toggle-mute";
        "XF86AudioStop" = "exec ${pkgs.playerctl}/bin/playerctl stop";
        "XF86AudioPrev" = "exec ${pkgs.playerctl}/bin/playerctl previous";
        "XF86AudioNext" = "exec ${pkgs.playerctl}/bin/playerctl next";
        "XF86AudioPlay" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
        
        # Brightness
        "XF86MonBrightnessDown" = "exec light -U 5";
        "XF86MonBrightnessUp" = "exec light -A 5";
        
        # Workspaces
        "${mod}+1" = "workspace 1";
        "${mod}+2" = "workspace 2";
        "${mod}+3" = "workspace 3";
        "${mod}+4" = "workspace 4";
        "${mod}+5" = "workspace 5";
        "${mod}+6" = "workspace 6";
        "${mod}+7" = "workspace 7";
        "${mod}+8" = "workspace 8";
        "${mod}+9" = "workspace 9";
        "${mod}+0" = "workspace 10";
        
        "${mod}+Shift+1" = "move container to workspace 1";
        "${mod}+Shift+2" = "move container to workspace 2";
        "${mod}+Shift+3" = "move container to workspace 3";
        "${mod}+Shift+4" = "move container to workspace 4";
        "${mod}+Shift+5" = "move container to workspace 5";
        "${mod}+Shift+6" = "move container to workspace 6";
        "${mod}+Shift+7" = "move container to workspace 7";
        "${mod}+Shift+8" = "move container to workspace 8";
        "${mod}+Shift+9" = "move container to workspace 9";
        "${mod}+Shift+0" = "move container to workspace 10";
      };
      
      assigns = {
        "1" = [ { class = "^Kitty$"; } ];
        "2" = [ { class = "^Vscode$"; } ];
        "3" = [ { class = "^Google-chrome$"; } ];
        "4" = [ { class = "^Discord$"; } ];
      };

      startup = [
        { 
          command = "systemctl --user restart polybar"; 
          always = true; 
          notification = false; 
        }
        {
          command = "${pkgs.networkmanagerapplet}/bin/nm-applet";
          always = true;
        }
        {
          command = "lxqt-policykit-agent";
          always = true;
        }
      ];

      terminal = term;

      window = {
        border = 2;
        titlebar = false;
      };
    };
  };
}
