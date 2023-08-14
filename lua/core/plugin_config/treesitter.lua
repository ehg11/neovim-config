require('nvim-treesitter.configs').setup({
    ensure_installed = { 'c', 'lua', 'rust', 'vim', 'python', 'typescript' },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
    autotag = { enable = true },
    yati = {
        enable = true,
        disable = { 'python' },
        default_lazy = true,
        default_fallback = 'auto',
    },
    indent = {
        enable = false,
    }
})
