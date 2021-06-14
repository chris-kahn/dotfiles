local bo = require('bufopt')

-- First we need some leadership
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.g.indentLine_char = '▏'
vim.g.indent_blankline_char = '▏'
-- vim.g.indentLine_concealcursor=""
-- vim.g.indentLine_conceallevel=2

vim.g.completion_enable_auto_popup = 1

vim.g['sneak#s_next'] = 1
vim.g['sneak#label'] = 1

-- Buffer-local options
local indent = 4
bo.tabstop = indent
bo.softtabstop = indent
bo.shiftwidth = indent
bo.smartindent = true
bo.expandtab = true
bo.autoindent = true

-- Global options
vim.o.cursorline = true
vim.o.cursorline = true
-- split a new buffer to the right
vim.o.splitright = true
-- split new buffer to the bottom
vim.o.splitbelow = true
-- briefly jump to matching seperator
vim.o.showmatch = true
-- case insensitive search
vim.o.ignorecase = true
-- highlight searches
vim.o.hlsearch = true
-- copy-paste with system clipboard
vim.o.clipboard = 'unnamedplus'
-- we support termguicolors
vim.o.termguicolors = true
-- abandon buffer when unloading
vim.o.hidden = true
-- some language servers dont like backup files
vim.o.backup = false
vim.o.writebackup = false
-- more space for coc messages
vim.o.cmdheight = 1
-- more responsiveness
vim.o.updatetime = 200
-- avoid some prompts?
vim.o.shortmess = vim.o.shortmess .. 'c'
-- scrolling "bounding"
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5
vim.o.mouse = 'a'
vim.o.joinspaces = false
vim.o.smartcase = true
vim.o.wildmode = 'list:longest'
vim.o.completeopt = 'menuone,noselect'
vim.cmd [[set shortmess+=c]]

vim.wo.number = false
vim.wo.list = true
vim.wo.cursorline = true
vim.wo.signcolumn = 'yes'

-- enable syntax highlighting
vim.cmd('syntax on')

-- enable filetype detection
vim.cmd('filetype plugin indent on')
