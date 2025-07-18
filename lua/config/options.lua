-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.number = true -- Show line numbers
opt.mouse = "a" -- Enable mouse mode
opt.showmode = false -- Don't show the mode
opt.clipboard = "unnamedplus" -- Sync clipboard between OS and Neovim
opt.breakindent = true -- Enable break indent
opt.undofile = true -- Save undo history
opt.ignorecase = true -- Ignore case by default
opt.smartcase = true -- Case sensitive if an uppercase is entered
opt.signcolumn = "yes" -- Enable signcolumn
opt.updatetime = 250 -- Decrease update time
opt.timeoutlen = 300 -- Decrease mapped sequence wait time
opt.splitright = true -- Open new horizontal splits right
opt.splitbelow = true -- Open new vertical splits bottom
opt.list = true -- Set how Neovim will display certain whitespace characters in the editor
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.inccommand = "split" -- Preview substitution live as you type
opt.cursorline = true -- Show which line your cursor is on
opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor
opt.confirm = true -- Asking if you want to save changes when exit an unsaved buffer
opt.tabstop = 4 -- Number of spaces per tab
opt.softtabstop = 4 -- Number of spaces in tab when editing
opt.shiftwidth = 4 -- Insert 4 spaces on tab
opt.expandtab = true -- Use spaces instead of tabs
opt.smartindent = true -- Insert indents automatically
opt.completeopt = { "menu", "menuone", "noselect" }
