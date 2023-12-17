return {
    'nkakouros-original/numbers.nvim',
    config = function()
        local numbers = require('numbers')
        numbers.setup({
            excluded_filetypes = {
                'help',
                'dashboard',
                'NvimTree',
                'Trouble',
                'toggleterm',
                'aerial',
                'mason',
            }
        })
    end
}
