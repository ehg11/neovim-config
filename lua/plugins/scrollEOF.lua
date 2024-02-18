return {
    'Aasim-A/scrollEOF.nvim',
    event = 'VeryLazy',
    config = function()
        local scrollEOF = require('scrollEOF')
        scrollEOF.setup({
            insert_mode = true
        })
    end
}
