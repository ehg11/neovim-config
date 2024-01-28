return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        local lualine = require('lualine')
        lualine.setup({
            options = {
                icons_enabled = true,
                component_separators = '|',
                section_separators = '',
                theme = 'auto',
                disabled_filtypes = { statusline = { 'dashboard' }},
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
                            hint  = " ",
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
                            added    = " ",
                            modified = " ",
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
