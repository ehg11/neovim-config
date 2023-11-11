return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        local nvimTree = require('nvim-tree')
        nvimTree.setup({
            diagnostics = {
                enable = true,
                icons = {
                    error = " ",
                    warning = " ",
                    hint = " ",
                    info = " ",
                },
            },
            git = {
                enable = true,
            },
            filters = {
                git_ignored = false,
            }
        })

        vim.keymap.set('n', '<C-n>', ':NvimTreeFindFileToggle<cr>', {noremap = true, silent = true, desc = 'Open File Tree'})
    end
}
