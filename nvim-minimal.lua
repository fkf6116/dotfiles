-- ================================
-- Basic Settings
-- ================================
local vim = vim

vim.opt.sessionoptions = "curdir,folds,globals,help,tabpages,terminal,winsize"
vim.opt.conceallevel = 1
vim.opt.termguicolors = true
vim.opt.fillchars = { eob = " " }
vim.opt.clipboard = "unnamedplus"
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.winborder = "rounded"
vim.cmd("set mouse=a")
vim.cmd("set undodir=~/.local/tmp")
vim.cmd("set undofile")
vim.cmd("set expandtab")
vim.wo.relativenumber = true
vim.wo.number = true
vim.g.neovide_transparency = 0.8
vim.g.transparency = 0.8
vim.o.updatetime = 300

vim.g.mapleader = " "
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>', { desc = "Save & Source" })
vim.keymap.set('n', '<leader>q', ':wq<CR>', { desc = "Save & Quit" })

-- ================================
-- Plugins
-- ================================
vim.pack.add({
  { src = "https://github.com/echasnovski/mini.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/Saghen/blink.cmp", name = "blink.cmp", version = vim.version.range("1.0") },
  { src = "https://github.com/folke/which-key.nvim" }, -- Keybinding hints
})

require("which-key").setup({
  win = { border = "rounded" },
})

require("which-key").add({
  { "<leader>o", group = "Session / Config" },
  { "<leader>o", ":update<CR> :source<CR>", desc = "Save & Source" },
  { "<leader>q", ":wq<CR>", desc = "Save & Quit" },
  { "<leader>f", ":Pick files<CR>", desc = "Find Files" },
  { "<leader>h", ":Pick help<CR>", desc = "Help Tags" },
  { "<leader>rn", vim.lsp.buf.rename, desc = "Rename Symbol" },
  { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action" },
})

require("blink.cmp").setup({
  keymap = {
    preset = "default",
    ["<CR>"] = { "accept", "fallback" },
    ["<Tab>"] = { "select_next", "fallback" },
    ["<S-Tab>"] = { "select_prev", "fallback" },
  },
  sources = {
    default = { "lsp", "path", "buffer", "snippets" },
  },
})

-- ================================
-- LSP Setup
-- ================================
local capabilities = require("blink.cmp").get_lsp_capabilities()
require("lspconfig").lua_ls.setup { capabilities = capabilities }
require("lspconfig").pyright.setup { capabilities = capabilities }
require("lspconfig").clangd.setup { capabilities = capabilities }

vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "LSP Hover" })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "Find References" })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "Go to Implementation" })
vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, { desc = "Signature Help" })

vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, {
            focus = false,
            scope = "cursor",
            border = "rounded"
        })
    end
})

-- ================================
-- mini.nvim Modules
-- ================================
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
require("mini.notify").setup()
require("mini.starter").setup()
