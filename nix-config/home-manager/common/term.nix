{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    settings = {
      editor = {
        indent-guides = {
          character = "|";
          render = true;
        };

        lsp = {

          auto-signature-help = false;
          display-messages = true;

        };
        statusline = {

          left = [
            "mode"
            "spinner"
            "version-control"
            "file-name"
          ];

        };

        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };

      # languages.nix = [
      #   {
      #     name = "nix";
      #     auto-format = true;
      #     formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
      #   }
      # ];

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
      shell = "nu";
      # background_opacity = "0.75";
      # background_blur = 5;
    };
  };
  programs.foot.enable = true;
}
