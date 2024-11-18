{ ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;

    # TODO: Please clean this shit up into seperate files

    settings = {
      source = [
        #external files to add
      ];

      monitor = [
        "HDMI-A-1, 1920x1080@100, auto, 1"
        #monitor config here

      ];

      exec = [
        "lxqt-policykit-agent"
        " swaync"
      ];
      exec-once = [
        "hyprpaper"
        "emacs --daemon"
        "blueman-applet"

        "waybar"
      ];
      # TODO: change this because my keyboard layout is kinda weird honestly
      input = {
        kb_layout = "us";
        kb_options = "ctrl:nocaps, altwin:swap_alt_win";
        #        kb_variant = ",altgr-intl";
        #       kb_options = "grp:alt_space_toggle";
        #      repeat_delay = 300;
        #       repeat_rate = 50;
        sensitivity = 0.0;
        numlock_by_default = true;

        touchpad = {
          natural_scroll = true;
        };
      };

      general = {
        gaps_in = 10;
        gaps_out = 20;
        border_size = 1;
        layout = "master";

      };

      decoration = {
        rounding = 0;
        drop_shadow = true;
        shadow_range = 20;
        shadow_render_power = 2;
        inactive_opacity = 0.75;

        blur = {
          enabled = true;
          size = 8;
          passes = 3;
          ignore_opacity = true;
          new_optimizations = true;
          popups = true;
          xray = true;
        };
      };

      animations = {
        enabled = true;
        # bezier = "myBezier, 0.05, 0.9, 0.1, 1.0.5";
        # animation = [
        #   "windows, 1, 10, myBezier, slide"
        #   "windowsOut, 1, 10, myBezier, popin"
        #   "border, 1, 10, default"
        #   "borderangle, 1, 8, default"
        #   "fade, 1, 7, default"
        #   "workspaces, 1, 6, default, slidevert"
        # ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "slave"; # slave, master, inherit
        no_gaps_when_only = 1;
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_min_speed_to_force = 10;
      };

      misc = {
        disable_hyprland_logo = true;
        focus_on_activate = true;
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
      };

      xwayland = {
        force_zero_scaling = true;
      };

      cursor = {
        no_hardware_cursors = true;
      };

      "$mainMod" = "SUPER"; # main modifier
      "$altMod" = "ALT"; # alternative modifier

      windowrulev2 = [
        # "opacity 0.8 0.8,class:(.*)"
        #
        "tile,class:(Aseprite)"
        # "fakefullscreen,class:^(code-url-handler)$"
        "fullscreen,class:^(cs2)$"
        "float,class:^(bevy)"
        "center,class:^(bevy)"
        # "forceinput,class:(jetbrains)"
        # "windowdance,class:(jetbrains)"
        # "stayfocused,class:(jetbrains)"
        "center,title:(Rename),class:(jetbrains)"
        "center,title:(Move),class:(jetbrains)"
        # "forceinput,title:Godot"
        # "windowdance,title:Godot"
        "tile,title:Godot"
        "nofocus,class:^ghidra-.+$,title:^win.+$,floating:1,fullscreen:0"
      ];

      layerrule = [
        "ignorealpha 0.59,ags-bar.*"
        "blur,eww-bar.*"
        "ignorezero,eww-bar.*"
        "blur,wofi"
        "ignorezero,wofi"
        "blur,launcher"
        "ignorezero,launcher"
        "blur,swaync.*"
        "ignorealpha 0.8,swaync.*"
      ];

      bind = [
        "$mainMod, Return, exec, kitty"
        "$mainMod, E, exec, emacsclient -c"

        "$mainMod, Q, killactive,"
        "$mainMod, M, exit, "
        "$mainMod SHIFT, F, togglefloating,"
        "$mainMod, F, fullscreen,"
        "$mainMod, D, exec, wofi --show drun --allow-images"
        "$mainMod, N, exec, swaync-client -t"
        "$mainMod SHIFT, S, exec, grimblast --notify --freeze copy area"
        "$mainMod CTRL, S, exec, grimblast --notify --freeze save area"

        # Move window focus
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"

        # Move to workspace
        "$mainMod, Tab, workspace, previous"
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

        # Move active window to workspace
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
      ];

      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_SOURCE@ toggle"

        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86audiostop, exec, playerctl stop"
      ];

      bindle = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"
        ", XF86MonBrightnessUp, exec, brightnessctl set 10%+"
        "SHIFT, XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        "SHIFT, XF86MonBrightnessUp, exec, brightnessctl set 5%+"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
