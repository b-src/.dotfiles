--  PLUGINS TO LOOK AT
--  Harpoon
--  Undotree

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
--
-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before lazy is called (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("lazy").setup("plugins", { diff = { cmd = "diffview.nvim" } })

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Use relative line numbers
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Set jk and kj to esc
vim.keymap.set('i', 'jk', '<esc>')
vim.keymap.set('i', 'kj', '<esc>')

-- Automatically center cursor with <C-u> and <C-d>
vim.keymap.set({ 'n', 'v' }, '<C-u>', '<C-u>zz')
vim.keymap.set({ 'n', 'v' }, '<C-d>', '<C-d>zz')

-- Source config file
vim.keymap.set('n', '<leader>con', "<cmd>source ~/.config/nvim/init.lua<CR>")

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Debugger keymaps
-- TODO: could be improved by making these lua functions
-- TODO: is this still the appropriate place for this?
-- I think yes, they should be set globally and not depend on the DAP plugins being loaded.
vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
vim.keymap.set("n", "<F7>", ":lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
vim.keymap.set("n", "<F8>", ":lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
vim.keymap.set("n", "<S-<F8>>", ":lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
vim.keymap.set("n", "<leader>b", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { desc = "Debugger set [B]reakpoint" })
vim.keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", { desc = "Debugger [L]og [P]oint message" })
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", { desc = "[D]ebugger [R]EPL" })


-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
