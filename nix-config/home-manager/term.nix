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
