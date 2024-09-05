return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },

  { "LunarVim/Colorschemes" },

  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  { "sainnhe/edge" },
  { "navarasu/onedark.nvim" },
  { "shaunsingh/nord.nvim" },
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },

  {
    "rebelot/kanagawa.nvim",
  },

  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_background = "hard"
    end,
  },

  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },

    config = function()
      require("gruvbox").setup({
        contrast = "hard",
        transparent_mode = false,
      })
      vim.cmd.colorscheme("gruvbox")
    end,
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function() end,
  },

  {
    "andrew-george/telescope-themes",
    config = function()
      require("telescope").load_extension("themes")
    end,
  },
}
