local function augroup(name)
    return vim.api.nvim_create_augroup('ehg_'..name, { clear = true})
end

local autocmd = vim.api.nvim_create_autocmd

autocmd({'FocusGained', 'TermClose', 'TermLeave'}, {
    group = augroup('checktime'),
    command = 'checktime'
})

autocmd({'TextYankPost'}, {
    group = augroup('highlight_yank'),
    callback = function()
        vim.highlight.on_yank()
    end,
})

autocmd({'VimResized'}, {
    group = augroup('resize_splits'),
    callback = function()
        local currTab = vim.fn.tabpagenr()
        vim.cmd('tabdo wincmd =')
        vim.cmd('tabnext '..currTab)
    end,
})

autocmd('FileType', {
    group = augroup('wrap_spell'),
    pattern = {'gitcommit', 'markdown'},
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end
})

local markdownSugar = function()
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

autocmd('FileType', {
    group = augroup('markdown_sugar'),
    pattern = {'markdown'},
    callback = markdownSugar
})

autocmd('Filetype', {
    group = augroup('markdown_spell'),
    pattern = {'markdown'},
    callback = function()
        vim.opt_local.conceallevel = 3
        vim.opt_local.spell = true

        vim.keymap.set('n', '<leader>sp', 'z=', { noremap = true, silent = true, desc = '[Sp]ell Check'})
    end
})

autocmd('BufEnter', {
    group = augroup('no_autocomment'),
    pattern = {'*'},
    callback = function()
        vim.cmd('set formatoptions-=cro')
        vim.cmd('setlocal formatoptions-=cro')
    end
})
