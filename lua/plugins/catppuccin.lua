return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
        local catppuccin = require('catppuccin')
        catppuccin.setup({
            integrations = {
                cmp = true,
                barbar = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
                indent_blankline = { enabled = true },
                lsp_trouble = true,
                mason = true,
                native_lsp = {
                    enabled = true,
                    underlines = {
                        errors = {'undercurl'},
                        hints = {'undercurl'},
                        warnings = {'undercurl'},
                        information = {'undercurl'},
                    },
                    virtual_text = {
                        errors = {},
                        hints = {},
                        warnings = {},
                        information = {},
                    },
                },
                semantic_tokens = true,
                telescope = true,
            },
            styles = {
                comments = {},
                conditionals = {}
            }
        })

        vim.cmd.colorscheme('catppuccin-macchiato')
    end
}
