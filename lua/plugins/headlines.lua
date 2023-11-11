return {
    'lukas-reineke/headlines.nvim',
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
        local headlines = require('headlines')
        headlines.setup({
            markdown = {
                headline_highlights = false,
                codeblock_highlight = "CodeBlock",
                dash_highlight = "Dash",
                dash_string = "-",
                quote_highlight = "Quote",
                quote_string = "┃",
                fat_headline_lower_string = "🬂",
            },
        })
    end
}
