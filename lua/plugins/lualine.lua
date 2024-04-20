return {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        local lualine = require('lualine')
        lualine.setup({
            options = {
                icons_enabled = true,
                component_separators = '|',
                section_separators = { left = ' ', right = ' ' },
                theme = 'catppuccin',
                disabled_filetypes = {
                    statusline = {
                        'dashboard',
                        'neo-tree',
                    }
                },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = {{ "branch", icon = "" }},

                lualine_c = {
                    {
                        "diagnostics",
                        symbols = {
                            error = " ",
                            warn  = " ",
                            hint  = "󰌵 ",
                            info  = " ",
                        },
                    },
                    {
                        "filename",
                        path = 1,
                    }
                },

                lualine_x = {
                    {
                        "diff",
                        symbols = {
                            added    = " ",
                            modified = " ",
                            removed  = " ",
                        },
                    },
                    {
                        'filetype',
                        icon_only = true
                    }
                },
            }
        })
    end,
}
