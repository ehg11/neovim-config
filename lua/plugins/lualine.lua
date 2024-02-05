return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'folke/noice.nvim',
    },
    config = function()
        local lualine = require('lualine')
        local noice = require('noice')
        lualine.setup({
            options = {
                icons_enabled = true,
                component_separators = '|',
                section_separators = { left = '', right = '' },
                theme = 'auto',
                disabled_filetypes = { statusline = { 'dashboard' }},
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
                        noice.api.status.mode.get,
                        cond = noice.api.status.mode.has,
                        color = { fg = "#ff9e64" },
                    },
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
