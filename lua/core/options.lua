vim.g.mapleader = ' '

local opt = vim.opt

opt.breakindent = true
opt.completeopt = 'menuone,noselect'
opt.conceallevel = 3
opt.cursorline = true
opt.expandtab = true
opt.fillchars = { eob = ' ' }
opt.formatoptions = 'jqlnt'
opt.hlsearch = false
opt.ignorecase = true
opt.inccommand = 'nosplit'
opt.incsearch = true
opt.laststatus = 3
opt.linebreak = true
opt.mouse = 'a'
opt.pumblend = 10
opt.pumheight = 10
opt.scrolloff = 12
opt.shiftround = true
opt.shiftwidth = 4
opt.showmode = false
opt.signcolumn = 'yes'
opt.smartcase = true
opt.smartindent = true
opt.smarttab = true
opt.spelllang = { 'en' }
opt.splitbelow = true
opt.splitkeep = 'screen'
opt.splitright = true
opt.tabstop = 4
opt.termguicolors = true
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.virtualedit = 'block'
opt.wildmode = 'longest:full,full'
opt.winminwidth = 5
opt.wrap = true
