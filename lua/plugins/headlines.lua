return {
    'lukas-reineke/headlines.nvim',
    event = 'VeryLazy',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function()
        local headlines = require('headlines')
        headlines.setup({
            markdown = {
                headline_highlights = false,
                codeblock_highlight = false,
                dash_highlight = false,
                dash_string = '-',
                quote_highlight = false,
                quote_string = '┃',
            },
        })
    end,
}
