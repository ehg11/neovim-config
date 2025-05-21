return {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre', 'VeryLazy' },
    build = ':TSUpdate',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
        local treesitter = require('nvim-treesitter.configs')
        require('nvim-treesitter.install').prefer_git = true
        treesitter.setup({
            auto_install = true,
            textobjects = {
                select = {
                    enable = false,
                },
            },
        })
    end,
}
