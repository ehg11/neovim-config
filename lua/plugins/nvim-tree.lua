return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        local nvim_tree = require('nvim-tree')
        nvim_tree.setup({
            diagnostics = {
                enable = true,
                icons = {
                    error = " ",
                    warning = " ",
                    hint = "󰌵 ",
                    info = " ",
                },
            },
            view = {
                width = 30,
            },
            git = {
                enable = true,
            },
            filters = {
                git_ignored = false,
            },
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
        })

        vim.keymap.set('n', '<C-n>', ':NvimTreeFindFileToggle<cr>', {
            noremap = true,
            silent = true,
            desc = 'Open File Tree'
        })
    end
}
