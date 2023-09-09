--  PLUGINS TO LOOK AT
--  ******* nvim-neotest/neotest *******
--  nvim-orgmode/orgmode
--  itchyny/vim-qfedit
--  ThePrimeagen/refactoring.nvim
--  Shatur/neovim-session-manager -- compare to folke/persistence.nvim
--  MAY NEED NIGHTLY/AREN'T READY YET
--  folke/noice.nvim

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
vim.o.undofile = 10000
vim.o.undodir = os.getenv("HOME") .. "/.nvim_undodir"

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

-- Automatically center cursor for:
-- half page scroll
vim.keymap.set({ 'n', 'v' }, '<C-u>', '<C-u>zz')
vim.keymap.set({ 'n', 'v' }, '<C-d>', '<C-d>zz')
-- tag stack and cursor jumps
vim.keymap.set({ 'n', 'v' }, '<C-t>', '<C-t>zz')
vim.keymap.set({ 'n', 'v' }, '<C-g>', '<C-g>zz')
vim.keymap.set({ 'n', 'v' }, '<C-o>', '<C-o>zz')
vim.keymap.set({ 'n', 'v' }, '<C-i>', '<C-i>zz')
-- next
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- Switch windows directly with CTRL-<direction>
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Keep cursor in the current location on yank instead of moving back to the start
vim.keymap.set('v', 'y', 'ygv<Esc>')

-- Move selections
vim.keymap.set("v", "J", ":m '>+1<CR>gv==kgvo<esc>=kgvo", { desc = "move highlighted text down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv==jgvo<esc>=jgvo", { desc = "move highlighted text up" })

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
