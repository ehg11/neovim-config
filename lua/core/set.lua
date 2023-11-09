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
vim.opt.scrolloff = 12

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

-- remove autocomment on newline
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

local function markdown_sugar()
    local augroup = vim.api.nvim_create_augroup('markdown', {})
    vim.api.nvim_create_autocmd('BufEnter', {
        pattern = '*.md',
        group = augroup,
        callback = function()
            vim.cmd [[
                syn match mkdListItem "^\s*[-*+]\s\+" contains=mkdListTab,mkdListBullet2
                syn match mkdListItem "^\s*\d\+\.\s\+" contains=mkdListTab
                syn match mkdListTab "^\s*\*" contained contains=mkdListBullet1
                syn match mkdListBullet1 "\*" contained conceal cchar=•
                syn match mkdListBullet2 "[-*+]" contained conceal cchar=•

                syn region htmlH1 matchgroup=mkdDelimiter start="^\s*#" end="\($\|[^\\]#\+\)" concealends contains=@Spell,mkdEscapeChar
                syn region htmlH2 matchgroup=mkdDelimiter start="^\s*##" end="\($\|[^\\]#\+\)" concealends contains=@Spell,mkdEscapeChar
                syn region htmlH3 matchgroup=mkdDelimiter start="^\s*###" end="\($\|[^\\]#\+\)" concealends contains=@Spell,mkdEscapeChar
                syn region htmlH4 matchgroup=mkdDelimiter start="^\s*####" end="\($\|[^\\]#\+\)" concealends contains=@Spell,mkdEscapeChar
                syn region htmlH5 matchgroup=mkdDelimiter start="^\s*#####" end="\($\|[^\\]#\+\)" concealends contains=@Spell,mkdEscapeChar
                syn region htmlH6 matchgroup=mkdDelimiter start="^\s*######" end="\($\|[^\\]#\+\)" concealends contains=@Spell,mkdEscapeChar
                syn match htmlH1 /^.\+\n=\+$/ contains=@Spell
                syn match htmlH2 /^.\+\n-\+$/ contains=@Spell
                syn match mkdEscape "\\[`\*_{}\[\]()#\+-\.\!]" contained contains=mkdEscapeChar
                syn match mkdEscapeChar "\\" contained conceal
            ]]
        end
    })
end

markdown_sugar()
