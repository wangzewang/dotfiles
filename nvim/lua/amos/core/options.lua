local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 4 -- 4 spaces for tabs
opt.shiftwidth = 4 -- 2 spaces for indent width
opt.softtabstop = 4
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.hlsearch = true
opt.incsearch = true

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.iskeyword:append("-") -- consider string-string as whole word

vim.api.nvim_command("highlight ExtraWhitespace ctermbg=red guibg=red")

vim.g.python3_host_prog = vim.fn.expand("~/.pyenv/versions/3.7.7/bin/python3.7")
vim.g.python_host_prog = vim.fn.expand("~/.pyenv/versions/2.7.16/bin/python2.7")

vim.api.nvim_command("highlight ColorColumn ctermbg=238 guibg=#3c3b37")
vim.api.nvim_command([[call matchadd('ColorColumn', '\%81v', 100)]])
vim.api.nvim_command([[set fileencoding=utf-8]])
vim.api.nvim_command([[set encoding=utf-8]])
vim.api.nvim_command([[set fileencodings=utf-8,latin1]])
vim.api.nvim_command([[set fileformats=unix,dos,mac]])

vim.api.nvim_command([[set wildmenu]])
vim.api.nvim_command([[set wildmode=list:longest,list:full]])
vim.api.nvim_command([[set wildignore+=.pyc,.pyo,/.git/,/node_modules/]])

-- vim.api.nvim_command([[set noswapfile]])
vim.api.nvim_command([[set directory=$HOME/.vim/swapfiles//]])

opt.colorcolumn = "120"
