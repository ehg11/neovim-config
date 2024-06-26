vim.g.mapleader = ' '

local opt = vim.opt

opt.breakindent = true
local windows_nvim_directory = '/mnt/c/Neovim/bin/'
local yank_path = windows_nvim_directory .. '/win32yank.exe'
vim.g.clipboard = {
    name = 'win32yank.exe-wsl',
    copy = {
        ['+'] = yank_path .. ' -i --crlf',
        ['*'] = yank_path .. ' -i --crlf',
    },
    paste = {
        ['+'] = yank_path .. ' -o --lf',
        ['*'] = yank_path .. ' -o --lf',
    },
    cache_enabled = 1,
}
opt.clipboard = 'unnamedplus'
opt.colorcolumn = ''
opt.completeopt = 'menuone,noselect'
opt.cursorline = true
opt.expandtab = true
opt.fillchars = { eob = ' ' }
opt.formatoptions = 'jqlnt'
opt.hlsearch = false
opt.ignorecase = true
opt.inccommand = 'split'
opt.incsearch = true
opt.laststatus = 3
opt.linebreak = true
opt.mouse = 'a'
opt.number = true
opt.relativenumber = true
opt.ruler = false
opt.pumblend = 10
opt.pumheight = 10
opt.scrolloff = 8
opt.shiftround = true
opt.shiftwidth = 4
opt.showmode = false
opt.signcolumn = 'yes'
opt.smartcase = true
opt.smartindent = false
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

vim.diagnostic.config({ underline = true })
