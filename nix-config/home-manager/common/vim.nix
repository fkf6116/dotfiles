{
  pkgs,
  nvf,
  lib,
  inputs,
  ...
}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        keymaps = [
          {
            key = "<leader>wq";
            mode = ["n"];
            action = ":wq<CR>";
            silent = true;
            desc = "Save file and quit";
          }
          {
            key = "<leader>nt";
            mode = ["n"];
            action = ":Neotree toggle<CR>";
            silent = true;
            desc = "File tree (Neotree)";
          }
          {
            key = "<leader>ff";
            mode = ["n"];
            action = ":Telescope find_files<CR>";
            silent = true;
            desc = "Find files";
          }
          {
            key = "<leader>fg";
            mode = ["n"];
            action = ":Telescope live_grep<CR>";
            silent = true;
            desc = "Search in files";
          }
          {
            key = "<leader>fb";
            mode = ["n"];
            action = ":Telescope buffers<CR>";
            silent = true;
            desc = "List buffers";
          }
          {
            key = "<leader>fh";
            mode = ["n"];
            action = ":Telescope help_tags<CR>";
            silent = true;
            desc = "Search help";
          }
        ];

        # Enable custom theming options
        # Enable Treesitter

        telescope.enable = true;

        viAlias = true;
        vimAlias = true;
        debugMode = {
          enable = false;
          level = 16;
          logFile = "/tmp/nvim.log";
        };

        spellcheck = {
          enable = true;
        };

        lsp = {
          enable = true;
          formatOnSave = true;
          lspkind.enable = true;
          lightbulb.enable = true;
          lspsaga.enable = true;
          trouble.enable = true;
          lspSignature.enable = true;
          otter-nvim.enable = true;
          nvim-docs-view.enable = true;
        };

        debugger = {
          nvim-dap = {
            enable = true;
            ui.enable = true;
          };
        };

        # This section does not include a comprehensive list of available language modules.
        # To list all available language module options, please visit the nvf manual.
        languages = {
          enableFormat = true;
          enableTreesitter = true;
          enableExtraDiagnostics = true;

          # Languages that will be supported in default and maximal configurations.
          nix.enable = true;
          markdown.enable = true;

          # Languages that are enabled in the maximal configuration.
          bash.enable = true;
          clang.enable = true;
          css.enable = true;
          html.enable = true;
          sql.enable = true;
          # java.enable = true;
          # kotlin.enable = true;
          ts.enable = true;
          go.enable = true;
          lua.enable = true;
          zig.enable = true;
          python.enable = true;
          typst.enable = true;
          rust = {
            enable = true;
            crates.enable = true;
          };

          # Language modules that are not as common.
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

          tailwind.enable = false;
          svelte.enable = false;

          # Nim LSP is broken on Darwin and therefore
          # should be disabled by default. Users may still enable
          # `vim.languages.vim` to enable it, this does not restrict
          # that.
          # See: <https://github.com/PMunch/nimlsp/issues/178#issue-2128106096>
          nim.enable = false;
        };

        visuals = {
          nvim-scrollbar.enable = true;
          nvim-web-devicons.enable = true;
          nvim-cursorline.enable = true;
          # cinnamon-nvim.enable = true;
          fidget-nvim.enable = true;

          highlight-undo.enable = true;
          indent-blankline.enable = true;

          # Fun
          # cellular-automaton.enable = true;
        };

        statusline = {
          lualine = {
            enable = true;
            #            theme = "gruvbox";
          };
        };

        autopairs.nvim-autopairs.enable = true;

        autocomplete.nvim-cmp.enable = true;
        snippets.luasnip.enable = true;

        filetree = {
          neo-tree = {
            enable = true;
          };
        };

        tabline = {
          nvimBufferline.enable = true;
        };

        treesitter.context.enable = true;

        binds = {
          whichKey.enable = true;
          cheatsheet.enable = true;
        };

        git = {
          enable = true;
          gitsigns.enable = true;
          gitsigns.codeActions.enable = true;
        };

        minimap = {
          minimap-vim.enable = false;
          codewindow.enable = true; # lighter, faster, and uses lua for configuration
        };

        dashboard = {
          dashboard-nvim.enable = false;
          alpha.enable = true;
        };

        notify = {
          nvim-notify.enable = true;
        };

        projects = {
          project-nvim.enable = true;
        };

        utility = {
          ccc.enable = true;
          vim-wakatime.enable = true;
          icon-picker.enable = true;
          surround.enable = true;
          diffview-nvim.enable = true;
          motion = {
            hop.enable = true;
            leap.enable = true;
          };

        };

        notes = {
          obsidian.enable = false; # FIXME: neovim fails to build if obsidian is enabled
          neorg.enable = false;
          orgmode.enable = false;
          mind-nvim.enable = true;
          todo-comments.enable = true;
        };

        terminal = {
          toggleterm = {
            enable = true;
            lazygit.enable = true;
          };
        };

        ui = {
          borders.enable = true;
          noice.enable = true;
          colorizer.enable = true;
          modes-nvim.enable = false; # the theme looks terrible with catppuccin
          illuminate.enable = true;
          breadcrumbs = {
            enable = true;
            navbuddy.enable = true;
          };
          smartcolumn = {
            enable = true;
            setupOpts.custom_colorcolumn = {
              # this is a freeform module, it's `buftype = int;` for configuring column position
              nix = "110";
              ruby = "120";
              java = "130";
              go = [
                "90"
                "130"
              ];
            };
          };
          fastaction.enable = true;
        };

        session = {
          nvim-session-manager.enable = true;
        };

        gestures = {
          gesture-nvim.enable = true;
        };

        comments = {
          comment-nvim.enable = true;
        };

        presence = {
          neocord.enable = true;
        };

        # Other options will go here. Refer to the config
        # reference in Appendix B of the nvf manual.
        # ...
      };
    };
  };
}
