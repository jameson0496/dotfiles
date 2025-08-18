--                            _           
--   _ __   ___   ___ __   __(_)_ __ ___  
--  | '_ \ / _ \ / _ \\ \ / /| | '_ ` _ \ 
--  | | | |  __/| (_) |\ V / | | | | | | |
--  |_| |_|\___| \___/  \_/  |_|_| |_| |_|
--

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require('keybinds')
require('plugins')
--require('lsp')

-- Use `:h <option>` for help

-- disable netrw in favor of nvim-tree.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

-- Tab --
vim.opt.tabstop = 8 -- number of spaces a tab character appears as, default: 8
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true -- tabs are entered as spaces
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.wildmenu = true
vim.opt.wildmode = 'list:longest'
vim.opt.modeline = true

vim.opt.scrolloff = 10

-- UI --
vim.opt.wrap = true
vim.opt.wrapscan = true
vim.opt.number = true -- line numbers
vim.opt.relativenumber = true -- relative line numbers
vim.opt.cursorline = true
vim.opt.splitright = true -- open new vs splits on the right
vim.opt.splitbelow = true -- open new sp splits on the top
vim.opt.incsearch = true -- search as text is entered

-- vim.opt.spell = true
vim.opt.hidden = true
vim.opt.autoread = true
-- vim.opt.formatoptions = 'jql' -- default is jcroql
-- makes comment markers not auto fill on new lines https://vi.stackexchange.com/a/1985
vim.cmd([[autocmd FileType * set fo-=r fo-=o fo-=c]])
vim.opt.ruler = true
--vim.opt.laststatus=2
--vim.opt.statusline=%f\ %r%m
--vim.opt.statusline+=%=
--vim.opt.statusline+=%l/%L\ %p%%\ %y

-- syntax on --enabled by default, same as `syntax enable`
-- vim.opt.paste = true

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

-- Setup lazy.nvim
require("lazy").setup("plugins", {
    defaults = { lazy = true },
    install = { colorscheme = { "one-nvim" } },
    checker = { enabled = true, notify = false },
    change_detection = { notify = false, },
})

-- make backgrounds transparent
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]
