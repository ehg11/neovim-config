return {
    'nmac427/guess-indent.nvim',
    event = 'VeryLazy',
    config = function()
        local guessIndent = require('guess-indent')
        guessIndent.setup({ })
    end
}
