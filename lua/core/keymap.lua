vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "p", [["_dP]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>a')

vim.keymap.set("n", "<M-l>", [[<cmd>vertical resize +5<cr>]], { desc = 'Grow Window Vertically' })
vim.keymap.set("n", "<M-h>", [[<cmd>vertical resize -5<cr>]], { desc = 'Shrink Window Vertically' })
vim.keymap.set("n", "<M-k>", [[<cmd>horizontal resize +2<cr>]], { desc = 'Grow Window Horizontally'})
vim.keymap.set("n", "<M-j>", [[<cmd>horizontal resize -2<cr>]], { desc = 'Shrink Window Horizontally'})

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = 'Move to Left Window' })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = 'Move to Right Window' })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = 'Move to Bottom Window' })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = 'Move to Top Windw' })

vim.keymap.set('n', '<C-w>h', '<C-w>s')

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})
