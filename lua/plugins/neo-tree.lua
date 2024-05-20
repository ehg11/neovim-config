return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
        'MunifTanjim/nui.nvim',
    },
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        vim.keymap.set('n', '<C-n>', '<cmd>Neotree toggle<CR>', {
            noremap = true,
            silent = true,
        })
        vim.fn.sign_define(
            'DiagnosticSignError',
            { text = ' ', texthl = 'DiagnosticSignError' }
        )
        vim.fn.sign_define(
            'DiagnosticSignWarn',
            { text = ' ', texthl = 'DiagnosticSignWarn' }
        )
        vim.fn.sign_define(
            'DiagnosticSignInfo',
            { text = ' ', texthl = 'DiagnosticSignInfo' }
        )
        vim.fn.sign_define(
            'DiagnosticSignHint',
            { text = '󰠠', texthl = 'DiagnosticSignHint' }
        )

        local neotree = require('neo-tree')
        neotree.setup({
            popup_border_style = 'rounded',
            enable_git_status = true,
            enable_diagnostics = true,
            open_files_do_not_replace_types = {
                'terminal',
                'toggleterm',
                'trouble',
            },
            sort_case_insensitive = true,
            git_status = {
                symbols = {
                    added = '',
                    modified = '',
                    deleted = '',
                    renamed = '',
                    untracked = '',
                    ignored = '',
                    unstaged = '󰄱',
                    staged = '',
                    conflict = '',
                },
            },
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_hidden = false,
                },
            },
            event_handlers = {
                {
                    event = 'file_opened',
                    handler = function(_)
                        require('neo-tree.command').execute({ action = 'close' })
                    end,
                },
                {
                    event = 'neo_tree_buffer_enter',
                    handler = function()
                        vim.cmd('highlight! Cursor blend=100')
                    end,
                },
                {
                    event = 'neo_tree_buffer_leave',
                    handler = function()
                        vim.cmd('highlight! Cursor guibg=#5f87af blend=0')
                    end,
                },
            },
        })
    end,
}
