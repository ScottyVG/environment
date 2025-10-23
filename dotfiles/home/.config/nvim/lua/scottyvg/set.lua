--vim.opt.guicursor = "" -- fat cursor

vim.opt.nu = true -- line numbers
vim.opt.relativenumber = true -- relative line numbers

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false -- no linewrap

-- long running undos for undo tree
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Enhanced search settings from TJ DeVries
vim.opt.hlsearch = false -- no highlighting as I search
vim.opt.incsearch = true
vim.opt.smartcase = true -- case-insensitive unless uppercase used
vim.opt.ignorecase = true -- case-insensitive search
vim.opt.inccommand = "split" -- live substitution preview

vim.opt.termguicolors = true -- good colors

vim.opt.scrolloff = 8 -- never less than 8 characters at the bottom of the file
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- Additional useful settings from TJ DeVries
vim.opt.splitbelow = true -- horizontal splits go below
vim.opt.splitright = true -- vertical splits go right
vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.formatoptions:remove("o") -- don't add comment on 'o' command
