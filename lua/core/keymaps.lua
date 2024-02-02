vim.g.mapleader = ' '

-- don't move my cursor
vim.keymap.set('n', 'J', 'mzJ`z')

-- center view after movements
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "{", "{zz")
vim.keymap.set("n", "}", "}zz")
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("n", "gg", "ggzz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "%", "%zz")

-- Too many plugins use q to close, remapping Q for macros
vim.keymap.set('n', 'Q', 'q', { noremap = true })
vim.keymap.set('n', 'q', '<nop>', { noremap = true })

-- Moving lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- move cursor to end of selection after yank
vim.keymap.set('v', 'y', 'ygv<Esc>')

-- convenience to copy to system clipboard
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set({'n', 'v', 'x'}, '<leader>p', '"+p')

-- paste shouldn't overwrite my clipboard
vim.keymap.set({'v', 'x'}, 'p', '"_dP')

-- select all
vim.keymap.set('n', '<C-a>', 'ggVG')

-- better motion for multi-line
vim.keymap.set({'n', 'v'}, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({'n', 'v'}, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- window commands
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = 'Move to Left Window', remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = 'Move to Right Window', remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = 'Move to Bottom Window', remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = 'Move to Top Window', remap = true })
vim.keymap.set("n", "<C-Up>", [[<cmd>horizontal resize +5<cr>]], { desc = 'Increase Window Height' })
vim.keymap.set("n", "<C-Down>", [[<cmd>horizontal resize -5<cr>]], { desc = 'Decrease Window Height' })
vim.keymap.set("n", "<C-Right>", [[<cmd>vertical resize +2<cr>]], { desc = 'Increase Window Width'})
vim.keymap.set("n", "<C-Left>", [[<cmd>vertical resize -2<cr>]], { desc = 'Decrease Window Width'})

-- quitting (because I suck and have the explorer open)
vim.keymap.set('n', '<C-q>', ':qa!<CR>')
vim.keymap.set('i', '<C-q>', '<Esc>:wqa!<CR>')

-- I mess this up too often...
vim.keymap.set('n', 'q:', ':q', { noremap = true })
vim.keymap.set({'n', 'v', 'i'}, '<F1>', '<nop>')

-- better indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- diagnostic keybinds
local diagnosticsActive = true
local toggleDiagnostics = function ()
    diagnosticsActive = not diagnosticsActive
    vim.diagnostic.config({ virtual_text = diagnosticsActive })
end
vim.keymap.set('n', '<leader>dd', toggleDiagnostics, { desc = 'Toggle [D]iagnostics' })
vim.keymap.set('n', '<leader>dh', vim.diagnostic.open_float, { desc = '[D]iagnostic [Hover]' })
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, { desc = '[D]iagnostic [N]ext' })
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, { desc = '[D]iagnostic [P]revious' })
