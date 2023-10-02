require("catppuccin").setup({
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = false,
    },
    -- these are italic by default, removing them so they don't mess with
    -- indent blankline
    styles = {
        comments = {},
        conditionals = {},
    }
})

vim.cmd.colorscheme "catppuccin-frappe"
