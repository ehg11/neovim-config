return {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'antosha417/nvim-lsp-file-operations',
    },
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        vim.opt.splitright = false

        local tree = require('nvim-tree')
        local lsp_file_operations = require('lsp-file-operations')

        local function float_right()
            local screen_w = vim.opt.columns:get()
            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
            local window_w = screen_w * 0.5
            local window_h = screen_h * 0.8
            local window_w_int = math.floor(window_w)
            local window_h_int = math.floor(window_h)
            local center_y = ((vim.opt.lines:get() - window_h) / 2)
                - vim.opt.cmdheight:get()
            return {
                border = 'rounded',
                relative = 'editor',
                row = center_y,
                col = screen_w,
                width = window_w_int,
                height = window_h_int,
            }
        end

        tree.setup({
            disable_netrw = true,
            reload_on_bufenter = true,
            view = {
                width = {
                    min = 30,
                    max = -1,
                },
                float = {
                    enable = true,
                    open_win_config = float_right,
                },
            },
            renderer = {
                icons = {
                    glyphs = {
                        git = {
                            unstaged = '󰄱',
                            staged = '',
                            unmerged = '',
                            renamed = '➜',
                            untracked = '',
                            deleted = '',
                            ignored = '',
                        },
                    },
                },
            },
            diagnostics = {
                enable = true,
                show_on_dirs = true,
                icons = {
                    hint = '󰠠',
                    info = '',
                    warning = '',
                    error = '',
                },
            },
            filters = {
                enable = false,
            },
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
            ui = {
                confirm = {
                    default_yes = true,
                },
            },
        })
        lsp_file_operations.setup({})

        local set = vim.keymap.set
        set('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', {
            desc = 'Toggle File Tree',
            noremap = true,
            silent = true,
        })
    end,
}
