return {
    'HiPhish/rainbow-delimiters.nvim',
    dependencies = {
        "nvim-treesitter/nvim-treesitter"
    },
    config = function()
        local rainbow_setup = require('rainbow-delimiters.setup')
        rainbow_setup.setup({
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
