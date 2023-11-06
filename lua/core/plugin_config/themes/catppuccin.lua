require("catppuccin").setup({
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = false,
        indent_blankline = { enabled = true },
        lsp_trouble = true,
        mason = true,
        native_lsp = {
            enabled = true,
            underlines = {
                errors = { "undercurl" },
                hints = { "undercurl" },
                warnings = { "undercurl" },
                information = { "undercurl" },
            },
            virtual_text = {
                errors = {},
                hints = {},
                warnings = {},
                information = {},
            }
        },
        semantic_tokens = true,
        telescope = true,
    },
    -- these are italic by default, removing them so they don't mess with
    -- indent blankline
    styles = {
        comments = {},
        conditionals = {},
    }
})

vim.cmd.colorscheme "catppuccin-frappe"
