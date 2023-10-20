-- allow mouse
-- Note: numbers controlled by numbers.nvim plugin
vim.o.mouse = 'a'

-- used for finding, case insensitive search
vim.o.ignorecase = true
vim.o.smartcase = true

-- 4 space tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- auto indent
vim.opt.breakindent = true
vim.opt.smartindent = true

-- save undo history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- incremental search with :s/
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- themes
vim.opt.termguicolors = true

-- don't go all the way to the bottom to scroll
vim.opt.scrolloff = 8

-- single status line
vim.o.laststatus = 3

-- lualine shows my 
vim.cmd('set noshowmode')

-- decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- better completions
vim.opt.completeopt = 'menuone,noselect'

vim.opt.linebreak = true;
