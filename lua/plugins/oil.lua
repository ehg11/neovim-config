return {
    'stevearc/oil.nvim',
    event = 'VeryLazy',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        local oil = require('oil')
        oil.setup({
            lsp_file_methods = {
                autosave_changes = true,
            },
            keymaps = {
                ['<C-s>'] = false,
                ['<C-h>'] = false,
                ['<C-t>'] = false,
                ['<C-r>'] = 'actions.refresh',
            },
            view_options = {
                show_hidden = true,
            },
        })

        vim.keymap.set(
            'n',
            '<leader>-',
            oil.toggle_float,
            { desc = 'Oil: Toggle Floating Window' }
        )
    end,
}
