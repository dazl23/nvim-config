-- alias for this file
local o = vim.o

vim.g.mapleader = " "
vim.g.maplocalleader = " "

o.mouse = ""

o.clipboard = "unnamedplus"

o.breakindent = true
o.undofile = true

o.wildmenu = true

-- buffers can be hidden if modified
o.hidden = true

-- more natural splits
o.splitbelow = true
o.splitright = true

-- better searching
o.ignorecase = true
o.smartcase = true
o.hlsearch = true -- highlight search targets
o.incsearch = true

-- tabs
o.tabstop = 4
o.softtabstop = 4 -- see 4 spaces as a tab
o.expandtab = true -- convert tabs to whitespace
o.shiftwidth = 4 -- autoident width
o.autoindent = true -- indent newlines to the same as previous lines

-- line numbers and lines
o.number = true
o.relativenumber = true
o.cursorline = true -- highlight line cursor is on
o.cursorlineopt = "both"
o.signcolumn = "yes" -- shows signs in the number column
o.numberwidth = 2

o.ttyfast = true -- speeds up scrolling
o.showmode = true
o.magic = true -- :h magic

o.updatetime = 250
o.timeout = true
o.timeoutlen = 300

o.completeopt = 'menuone,noselect'

o.termguicolors = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })



local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.keymap.set('n', '<Leader>t', '<Cmd>enew<CR>')
vim.keymap.set('n', '<S-x>', '<Cmd>bd<CR>')
vim.keymap.set('n', '<S-k>', '<Cmd>bnext<CR>')
vim.keymap.set('n', '<S-j>', '<Cmd>bprevious<CR>')

vim.keymap.set('n', '<Leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>')
vim.keymap.set('n', '<Leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>')
vim.keymap.set('n', '<Leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>')
vim.keymap.set('n', '<Leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>')
vim.keymap.set('n', '<Leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>')
vim.keymap.set('n', '<Leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>')
vim.keymap.set('n', '<Leader>7', '<Cmd>BufferLineGoToBuffer 7<CR>')
vim.keymap.set('n', '<Leader>8', '<Cmd>BufferLineGoToBuffer 8<CR>')
vim.keymap.set('n', '<Leader>9', '<Cmd>BufferLineGoToBuffer 9<CR>')
