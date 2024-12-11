{
  programs.helix = {
    enable = true;
    settings = {
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
      keys.normal = {
        C-g = ":sh tmux popup -d \"#{pane_current_path}\" -xC -yC -w80% -h80% -E lazygit";

        C-y = ":sh tmux split-window -d -h  -p 40  yazi";
      };
    };
  };

  programs.zellij = {
    enable = true;
    settings = {
      pane_frames = false;
      tab_bar = false;
      default_layout = "compact";
      # theme = "rose-pine";
      # themes = {
      #   "nord" = {
      #     fg = "#D8DEE9";
      #     bg = "#2E3440";
      #     black = "#3B4252";
      #     red = "#BF616A";
      #     green = "#A3BE8C";
      #     yellow = "#EBCB8B";
      #     blue = "#81A1C1";
      #     magenta = "#B48EAD";
      #     cyan = "#88C0D0";
      #     white = "#E5E9F0";
      #     orange = "#D08770";
      #   };
      # "rose-pine" = {
      #   bg = "#403d52";
      #   fg = "#e0def4";
      #   red = "#eb6f92";
      #   green = "#31748f";
      #   blue = "#9ccfd8";
      #   yellow = "#f6c177";
      #   magenta = "#c4a7e7";
      #   orange = "#fe640b";
      #   cyan = "#ebbcba";
      #   # black = "#26233a";
      #   black = "#000000";
      #   white = "#e0def4";
      # };
    };
  };

  programs.wezterm.enable = true;
  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      dynamic_background_opacity = false;
      enable_audio_bell = false;
      mouse_hide_wait = "-1.0";
      window_padding_width = 10;
      cursor_trail = 3;
      # background_opacity = "0.75";
      # background_blur = 5;
    };
  };
  programs.foot.enable = true;
}
