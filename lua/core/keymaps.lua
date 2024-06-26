vim.g.mapleader = ' '

-- don't move my cursor
vim.keymap.set('n', 'J', 'mzJ`z')

-- center view after movements
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '{', '{zz')
vim.keymap.set('n', '}', '}zz')
vim.keymap.set('n', 'G', 'Gzz')
vim.keymap.set('n', 'gg', 'ggzz')
vim.keymap.set('n', '<C-o>', '<C-o>zz')
vim.keymap.set('n', '%', '%zz')

-- Too many plugins use q to close, remapping Q for macros
vim.keymap.set('n', 'Q', 'q', { noremap = true })
vim.keymap.set('n', 'q', '<nop>', { noremap = true })

-- Moving lines up/down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { silent = true, noremap = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { silent = true, noremap = true })

-- move cursor to end of selection after yank
vim.keymap.set('v', 'y', 'ygv<Esc>')

-- convenience to copy to system clipboard (unused with unnamedplus default)
-- vim.keymap.set('v', '<leader>y', '"+y')
-- vim.keymap.set({'n', 'v', 'x'}, '<leader>p', '"+p')

-- paste shouldn't overwrite my clipboard
vim.keymap.set({ 'v', 'x' }, 'p', '"_dP')
vim.keymap.set('n', 'x', '"_x')

function Smart_dd()
    if vim.api.nvim_get_current_line():match('^%s*$') then
        return '"_dd'
    else
        return 'dd'
    end
end

vim.keymap.set(
    'n',
    'dd',
    Smart_dd,
    { noremap = true, expr = true, silent = true }
)

-- select all
vim.keymap.set('n', '<C-a>', 'ggVG')

-- better motion for multi-line
vim.keymap.set(
    { 'n', 'v' },
    'k',
    "v:count == 0 ? 'gk' : 'k'",
    { expr = true, silent = true }
)
vim.keymap.set(
    { 'n', 'v' },
    'j',
    "v:count == 0 ? 'gj' : 'j'",
    { expr = true, silent = true }
)

-- window commands
vim.keymap.set(
    'n',
    '<C-h>',
    '<C-w>h',
    { desc = 'Move to Left Window', remap = true }
)
vim.keymap.set(
    'n',
    '<C-l>',
    '<C-w>l',
    { desc = 'Move to Right Window', remap = true }
)
vim.keymap.set(
    'n',
    '<C-j>',
    '<C-w>j',
    { desc = 'Move to Bottom Window', remap = true }
)
vim.keymap.set(
    'n',
    '<C-k>',
    '<C-w>k',
    { desc = 'Move to Top Window', remap = true }
)
vim.keymap.set(
    'n',
    '<C-Up>',
    [[<cmd>horizontal resize +5<cr>]],
    { desc = 'Increase Window Height', silent = true }
)
vim.keymap.set(
    'n',
    '<C-Down>',
    [[<cmd>horizontal resize -5<cr>]],
    { desc = 'Decrease Window Height', silent = true }
)
vim.keymap.set(
    'n',
    '<C-Right>',
    [[<cmd>vertical resize +2<cr>]],
    { desc = 'Increase Window Width', silent = true }
)
vim.keymap.set(
    'n',
    '<C-Left>',
    [[<cmd>vertical resize -2<cr>]],
    { desc = 'Decrease Window Width', silent = true }
)

-- save (after I removed autosave)
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>')
vim.keymap.set({ 'i', 'v' }, '<C-s>', '<Esc><cmd>w<CR>')

-- quitting (because I suck and have the explorer open)
vim.keymap.set(
    'n',
    '<M-q>',
    '<cmd>wall|qa!<CR>',
    { silent = true, noremap = true }
)
vim.keymap.set(
    { 'i', 'v' },
    '<M-q>',
    '<Esc><cmd>wall|qa!<CR>',
    { silent = true, noremap = true }
)

-- I mess this up too often...
vim.keymap.set('n', 'q:', ':q', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v', 'i' }, '<F1>', '<nop>')

-- better indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- cr in normal mode
vim.keymap.set('n', '<CR>', 'o<Esc>')

-- diagnostic keybinds
local diagnostics_active = true
local toggleDiagnostics = function()
    diagnostics_active = not diagnostics_active
    vim.diagnostic.config({ virtual_text = diagnostics_active })
end
vim.keymap.set(
    'n',
    '<leader>dd',
    toggleDiagnostics,
    { desc = 'Toggle [D]iagnostics' }
)

-- quick fix
vim.keymap.set('n', '<M-]>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<M-[>', '<cmd>cprev<CR>zz')

-- colorcolumn toggle
local colorcolumn_active = false
local toggle_colorcolumn = function()
    colorcolumn_active = not colorcolumn_active
    if colorcolumn_active then
        vim.opt.colorcolumn = '81'
    else
        vim.opt.colorcolumn = ''
    end
end
vim.keymap.set(
    'n',
    '<leader>cc',
    toggle_colorcolumn,
    { desc = 'Toggle [C]olor [C]olumn', silent = true, noremap = true }
)
