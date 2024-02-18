return {
    "0oAstro/dim.lua",
    event = 'VeryLazy',
    dependencies = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
    config = function()
        require('dim').setup({ })
    end
}
