return {
    'onsails/lspkind.nvim',
    config = function ()
        local lspkind = require('lspkind')
        lspkind.init({
            mode = 'symbol_text',
        })
    end
}
