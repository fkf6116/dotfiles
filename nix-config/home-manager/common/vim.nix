{
  pkgs,
  lib,
  ...
}: {
  programs.nvf = {
    enable = true;

    settings = {
      config.vim = {
        viAlias = true;
        vimAlias = true;

        debugMode = {
          enable = false;
          level = 16;
          logFile = "/tmp/nvim.log";
        };

        spellcheck = {
          enable = true;
          programmingWordlist.enable = false;
        };

        lsp = {
          enable = true;
          formatOnSave = true;
          lspkind.enable = false;
          lightbulb.enable = true;
          lspsaga.enable = false;
          trouble.enable = true;
          lspSignature.enable = true;
          otter-nvim.enable = false;
          nvim-docs-view.enable = false;
        };

        debugger.nvim-dap = {
          enable = true;
          ui.enable = true;
        };

        languages = {
          enableFormat = true;
          enableTreesitter = true;
          enableExtraDiagnostics = true;

          nix.enable = true;
          markdown.enable = true;

          bash.enable = false;
          clang.enable = false;
          css.enable = false;
          html.enable = false;
          sql.enable = false;
          java.enable = false;
          kotlin.enable = false;
          ts.enable = false;
          go.enable = false;
          lua.enable = false;
          zig.enable = false;
          python.enable = false;
          typst.enable = false;

          rust = {
            enable = false;
            crates.enable = false;
          };

          assembly.enable = false;
          astro.enable = false;
          nu.enable = false;
          csharp.enable = false;
          julia.enable = false;
          vala.enable = false;
          scala.enable = false;
          r.enable = false;
          gleam.enable = false;
          dart.enable = false;
          ocaml.enable = false;
          elixir.enable = false;
          haskell.enable = false;
          ruby.enable = false;
          fsharp.enable = false;
          tailwind.enable = false;
          svelte.enable = false;
          nim.enable = false;
        };

        visuals = {
          nvim-scrollbar.enable = false;
          nvim-web-devicons.enable = true;
          nvim-cursorline.enable = true;
          cinnamon-nvim.enable = true;
          fidget-nvim.enable = true;
          highlight-undo.enable = true;
          indent-blankline.enable = true;
          cellular-automaton.enable = false;
        };

        statusline.lualine = {
          enable = true;
          # theme = "catppuccin";
        };

        # theme = {
        #   enable = true;
        #   name = "catppuccin";
        #   style = "mocha";
        #   transparent = false;
        # };

        autopairs.nvim-autopairs.enable = true;

        autocomplete = {
          nvim-cmp.enable = true;
          blink-cmp.enable = false;
        };

        snippets.luasnip.enable = true;

        filetree.neo-tree.enable = true;

        tabline.nvimBufferline.enable = true;

        treesitter.context.enable = true;

        binds = {
          whichKey.enable = true;
          cheatsheet.enable = true;
        };

        telescope.enable = true;

        git = {
          enable = true;
          gitsigns = {
            enable = true;
            codeActions.enable = false;
          };
          neogit.enable = false;
        };

        minimap = {
          minimap-vim.enable = false;
          codewindow.enable = false;
        };

        dashboard = {
          dashboard-nvim.enable = true;
          alpha.enable = false;
        };

        notify.nvim-notify.enable = true;

        projects.project-nvim.enable = false;

        utility = {
          ccc.enable = false;
          vim-wakatime.enable = false;
          diffview-nvim.enable = true;
          yanky-nvim.enable = false;
          icon-picker.enable = false;
          surround.enable = false;
          leetcode-nvim.enable = false;
          multicursors.enable = false;
          smart-splits.enable = false;
          undotree.enable = false;
          nvim-biscuits.enable = false;

          motion = {
            hop.enable = true;
            leap.enable = true;
            precognition.enable = false;
          };

          images = {
            image-nvim.enable = false;
            img-clip.enable = false;
          };
        };

        notes = {
          obsidian.enable = false;
          neorg.enable = false;
          orgmode.enable = false;
          mind-nvim.enable = false;
          todo-comments.enable = true;
        };

        terminal.toggleterm = {
          enable = true;
          lazygit.enable = true;
        };

        ui = {
          borders.enable = true;
          noice.enable = true;
          colorizer.enable = true;
          modes-nvim.enable = false;
          illuminate.enable = true;

          breadcrumbs = {
            enable = false;
            navbuddy.enable = false;
          };

          smartcolumn = {
            enable = true;
            setupOpts.custom_colorcolumn = {
              nix = "110";
              ruby = "120";
              java = "130";
              go = ["90" "130"];
            };
          };

          fastaction.enable = true;
        };

        assistant = {
          chatgpt.enable = false;
          copilot = {
            enable = false;
            cmp.enable = false;
          };
          codecompanion-nvim.enable = false;
          avante-nvim.enable = false;
        };

        session.nvim-session-manager.enable = false;

        gestures.gesture-nvim.enable = false;

        comments.comment-nvim.enable = true;

        presence.neocord.enable = false;
      };
    };
  };
}
