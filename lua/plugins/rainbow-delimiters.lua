return {
    'HiPhish/rainbow-delimiters.nvim',
    dependencies = {
        "nvim-treesitter/nvim-treesitter"
    },
    config = function()
        local rainbow = require('rainbow-delimiters')
        local rainbow_setup = require('rainbow-delimiters.setup')
        rainbow_setup.setup({
            strategy = {
                [''] = rainbow.strategy['global'],
                vim = rainbow.strategy['local'],
            },
            query = {
                [''] = 'rainbow-delimiters',
                lua = 'rainbow-blocks',
            },
            priority = {
                [''] = 110,
                lua = 210,
            },
            highlight = {
                'RainbowDelimiterRed',
                'RainbowDelimiterYellow',
                'RainbowDelimiterOrange',
                'RainbowDelimiterGreen',
                'RainbowDelimiterBlue',
                'RainbowDelimiterViolet',
            },
        })
    end
}
