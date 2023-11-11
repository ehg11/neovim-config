return {
    'Aasim-A/scrollEOF.nvim',
    config = function()
        local scrollEOF = require('scrollEOF')
        scrollEOF.setup({
            insert_mode = true
        })
    end
}
