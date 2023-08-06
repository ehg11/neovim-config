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
    direction = 'horizontal',
    close_on_exit = true,
    shell = vim.o.shell
})

vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('ToggleTermAu', { clear = true }),
    callback = function()
        local opts = { noremap = true }
        vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-h>]], opts)
        vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-j>]], opts)
        vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-k>]], opts)
        vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-l>]], opts)
    end
})

vim.api.nvim_create_autocmd('TermEnter', {
    group = vim.api.nvim_create_augroup('TermEnterAu', { clear = true }),
    callback = function()
        vim.opt.nu = false
        vim.opt.relativenumber = false
    end
})

-- vim.api.nvim_create_autocmd('TermLeave', {
--     group = vim.api.nvim_create_augroup('TermLeaveAu', { clear = true }),
--     callback = function()
--         vim.opt.nu = true
--         vim.opt.relativenumber = true
--     end
-- })
