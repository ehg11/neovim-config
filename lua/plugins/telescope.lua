return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable('make') == 1
            end,
        },
    },
    config = function()
        local telescope = require('telescope')
        local telescope_ignore = {
            'node_modules/',
            'dist/',
            '.git/',
            '.venv',
            'build/',
            'build_coverage/',
            'CMakeFiles/',
        }

        telescope.setup({
            pickers = {
                live_grep = {
                    file_ignore_patterns = telescope_ignore,
                    additional_args = function(_)
                        return { '--hidden' }
                    end,
                },
                find_files = {
                    file_ignore_patterns = telescope_ignore,
                    hidden = true,
                    no_ignore = true,
                    no_ignore_parent = true,
                },
            },
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
            },
        })

        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        local builtin = require('telescope.builtin')
        vim.keymap.set(
            'n',
            '<leader>sf',
            builtin.find_files,
            { desc = '[S]earch [F]iles' }
        )
        vim.keymap.set(
            'n',
            '<leader>so',
            builtin.oldfiles,
            { desc = '[S]earch [O]ld Files' }
        )
        vim.keymap.set(
            'n',
            '<leader>gf',
            builtin.git_files,
            { desc = 'Search [G]it [F]iles' }
        )
        vim.keymap.set(
            'n',
            '<leader>sg',
            builtin.live_grep,
            { desc = '[S]earch by [G]rep' }
        )
        vim.keymap.set(
            'n',
            '<leader>sh',
            builtin.help_tags,
            { desc = '[S]earch [H]elp' }
        )
        vim.keymap.set(
            'n',
            '<leader>km',
            builtin.keymaps,
            { desc = 'Search [K]ey [M]aps' }
        )
        vim.keymap.set(
            'n',
            '<leader>sb',
            builtin.buffers,
            { desc = '[S]earch [B]uffers' }
        )
        vim.keymap.set(
            'n',
            '<leader>ss',
            builtin.lsp_document_symbols,
            { desc = '[S]earch [S]ymbols' }
        )
        vim.keymap.set(
            'n',
            '<leader>th',
            builtin.colorscheme,
            { desc = '[T][h]eme Switcher' }
        )
        vim.keymap.set(
            'n',
            '<leader>sd',
            builtin.diagnostics,
            { desc = '[S]earch [D]iagnostics' }
        )

        vim.keymap.set('n', '<leader>/', function()
            require('telescope.builtin').current_buffer_fuzzy_find(
                require('telescope.themes').get_dropdown({
                    winblend = 10,
                    previewer = false,
                })
            )
        end, { desc = '[/] Fuzzily search in current buffer' })
    end,
}
