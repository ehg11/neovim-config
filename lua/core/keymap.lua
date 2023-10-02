vim.g.mapleader = " "

-- making a new file is often useful for random notes
vim.keymap.set('n', '<leader>nf', ':enew<CR>', { desc = 'Open [N]ew [F]ile', silent = true })

-- better movement with J and K
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set('n', 'K', 'f s<CR><Esc>')

-- centering cursor after big jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- window moving
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = 'Move to Left Window' })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = 'Move to Right Window' })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = 'Move to Bottom Window' })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = 'Move to Top Windw' })

-- Too many plugins use q to close, remapping Q for macros
vim.keymap.set('n', 'Q', 'q', { noremap = true })
vim.keymap.set('n', 'q', '<nop>', { noremap = true })

-- Moving lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- move cursor to end of selection after yank
vim.keymap.set('v', 'y', 'ygv<Esc>')

-- pasting won't overwrite current clipboard
vim.keymap.set("x", "p", [["_dP]])

-- convenience to copy to system clipboard
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set({'n', 'v'}, '<leader>p', '"+p')

-- select all
vim.keymap.set('n', '<C-a>', 'ggVG')

-- better motion for multi-line
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- quitting
vim.keymap.set("i", "<C-c>", "<Esc>")

-- saving 
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>a')

-- resizing the window (used when there are multiple buffers)
vim.keymap.set("n", "<M-L>", [[<cmd>vertical resize +5<cr>]], { desc = 'Resize: Grow Window Vertically' })
vim.keymap.set("n", "<M-H>", [[<cmd>vertical resize -5<cr>]], { desc = 'Resize: Shrink Window Vertically' })
vim.keymap.set("n", "<M-K>", [[<cmd>horizontal resize +2<cr>]], { desc = 'Resize: Grow Window Horizontally'})
vim.keymap.set("n", "<M-J>", [[<cmd>horizontal resize -2<cr>]], { desc = 'Resize: Shrink Window Horizontally'})

-- split horizontal use 'h' instead of 's'
vim.keymap.set('n', '<C-w>h', '<C-w>s')

-- quitting (because I suck and have the explorer open)
vim.keymap.set('n', '<C-q>', ':qa!<CR>')
vim.keymap.set('i', '<C-q>', '<Esc>:wqa!<CR>')

-- I mess this up too often...
vim.keymap.set('n', 'q:', ':q', { noremap = true })

-- diagnostic keybinds
local diagnostics_active = true
vim.keymap.set('n', '<leader>dd', function()
    diagnostics_active = not diagnostics_active
    vim.diagnostic.config({ virtual_text = diagnostics_active })
end, { desc = 'Toggle [D]iagnostics'})
vim.keymap.set('n', '<leader>dh', function() vim.diagnostic.open_float() end,
    { desc = '[D]iagnostic [H]over'}
)

-- briefly highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

