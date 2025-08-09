local vim = vim
vim.opt.sessionoptions = "curdir,folds,globals,help,tabpages,terminal,winsize"
vim.opt.conceallevel = 1
vim.opt.termguicolors = true
vim.cmd("set mouse=a")
vim.cmd("set undodir=~/.local/tmp")
vim.cmd("set undofile")
vim.cmd("set expandtab")
vim.o.termguicolors = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.g.neovide_transparency = 0.8
vim.g.transparency = 0.8
vim.opt.fillchars = { eob = " " }
vim.opt.clipboard = "unnamedplus"
vim.wo.relativenumber = true
vim.wo.number = true
vim.o.winborder = "rounded"


-- keybinds


vim.g.mapleader = " "
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>q', ':wq<CR>')


-- Plugins


vim.pack.add({
  -- {src = "https://github.com/echasnovski/mini.pair"},
  {src = "https://github.com/echasnovski/mini.nvim"},
  {src = "https://github.com/neovim/nvim-lspconfig"},
  { src = "https://github.com/Saghen/blink.cmp", name = "blink.cmp", version = vim.version.range("1.0") },
})

vim.lsp.enable({"lua_ls", "pyright"})

require("blink.cmp").setup({
  keymap = { preset = "default" },
  sources = {
    default = { "lsp", "path", "buffer", "snippets" },
  },
})

local capabilities = require("blink.cmp").get_lsp_capabilities()
require("lspconfig").clangd.setup { capabilities = capabilities }

require("mini.statusline").setup()
require("mini.tabline").setup()
require("mini.pairs").setup()
require("mini.hipatterns").setup()
require("mini.colors").setup()
require("mini.git").setup()
require("mini.surround").setup()
require("mini.ai").setup()
require("mini.comment").setup()
require("mini.basics").setup()
require("mini.icons").setup()
require("mini.files").setup()
require("mini.pick").setup()
require("mini.basics").setup()
require("mini.notify").setup()
require("mini.starter").setup()

-- Plugin keymaps
-- 
vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>h', ":Pick help<CR>")
