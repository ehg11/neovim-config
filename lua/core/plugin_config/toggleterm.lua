require('toggleterm').setup({
    size = 20,
    open_mapping = [[<C-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = 'float',
    close_on_exit = true,
    shell = vim.o.shell
})

vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('ToggleTermAu', { clear = true }),
    callback = function()
        vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, desc = 'Leave Terminal Mode' })
        vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-h>]], { noremap = true, desc = 'Move to Left Window'})
        vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-j>]], { noremap = true, desc = 'Move to Bottom Window'})
        vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-k>]], { noremap = true, desc = 'Move to Top Window'})
        vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-l>]], { noremap = true, desc = 'Move to Right Window'})
    end
})

vim.api.nvim_create_autocmd('TermEnter', {
    group = vim.api.nvim_create_augroup('TermEnterAu', { clear = true }),
    callback = function()
        vim.opt.nu = false
        vim.opt.relativenumber = false
    end
})
vim.api.nvim_create_autocmd('TermLeave', {
    group = vim.api.nvim_create_augroup('TermLeaveAu', { clear = true }),
    callback = function()
        vim.opt.nu = false
        vim.opt.relativenumber = false
    end
})

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true })

function _lazygit_toggle()
    lazygit:toggle()
end

vim.keymap.set('n', '<leader>lg', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true, desc = 'Open [L]azy [G]it'})
