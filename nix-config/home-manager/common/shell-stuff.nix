{
  pkgs,
  lib,
  ...
}:
{
  xdg.configFile."starship.toml".source = ./starship.toml;

  home.packages = with pkgs; [
    pkgs.fishPlugins.autopair
    fishPlugins.fzf-fish
  ];
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    # tmux.enableShellIntegration = true;
  };
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "fruity-fkf";
    userEmail = "fruity.fkf@proton.me";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    options = [ "--cmd cd" ];
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.nushell = {
    enable = true;
    extraConfig = ''
      let carapace_completer = {|spans|
      carapace $spans.0 nushell $spans | from json
      }
      $env.config = {
       show_banner: false,
      }
      $env.PATH = ($env.PATH |
      split row (char esep) |
      prepend /home/myuser/.apps |
      append /usr/bin/env
      )
    '';
    shellAliases = {
      vi = "hx";
      # vim = "hx";
      # nvim = "hx";
      ga = "git add";
      gcm = "git commit -m";
      gp = "git push";
      nano = "hx";
      gaa = "git add .";
    };
  };

  programs.carapace.enable = true;
  programs.carapace.enableFishIntegration = false;

  programs.helix = {
    enable = true;
    settings = {
      editor = {
        end-of-line-diagnostics = "hint";
        auto-format = true;
        path-completion = true;

        inline-diagnostics = {
          cursor-line = "warning";
        };

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

      keys = {
        normal = {
          C-g = ":sh tmux popup -d \"#{pane_current_path}\" -xC -yC -w80% -h80% -E lazygit";

          C-y = ":sh tmux split-window -d -h  -p 40  yazi";

          n = "move_char_left";
          e = "move_line_down";
          i = "move_line_up";
          o = "move_char_right";

          h = "insert_mode";
          H = "insert_at_line_start";

          l = "open_below";
          L = "open_above";

          k = "move_next_word_end";
          K = "move_next_long_word_end";

          j = "search_next";
          J = "search_prev";

          E = "join_selections";
          "A-E" = "join_selections_space";

          I = "keep_selections";
          "A-I" = "remove_selections";

          z = {
            e = "scroll_down";
            i = "scroll_up";
          };

          Z = {
            e = "scroll_down";
            i = "scroll_up";
          };

          g = {
            n = "goto_line_start";
            o = "goto_line_end";
            e = "move_line_down";
            i = "move_line_up";
          };

          space = {
            w = {
              n = "jump_view_left";
              e = "jump_view_down";
              i = "jump_view_up";
              o = "jump_view_right";
            };
          };

          "C-w" = {
            n = "jump_view_left";
            e = "jump_view_down";
            i = "jump_view_up";
            o = "jump_view_right";
          };
        };

        insert = {
          "A-x" = "normal_mode"; # Maps Alt-X to enter normal mode
        };

        select = {
          n = "move_char_left";
          e = "move_line_down";
          i = "move_line_up";
          o = "move_char_right";

          h = "insert_mode";
          H = "insert_at_line_start";

          l = "open_below";
          L = "open_above";

          k = "move_next_word_end";
          K = "move_next_long_word_end";

          j = "search_next";
          J = "search_prev";

          E = "join_selections";
          "A-E" = "join_selections_space";

          I = "keep_selections";
          "A-I" = "remove_selections";
        };

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
}
