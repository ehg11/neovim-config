return {
    'lukas-reineke/indent-blankline.nvim',
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    main = 'ibl',
    config = function()
        local ibl = require('ibl')
        ibl.setup()
        ibl.overwrite({
            exclude = {
                filetypes = {
                    'help',
                    'dashboard',
                    'NvimTree',
                    'Trouble',
                    'mason',
                    'toggleterm',
                }
            },
            scope = {
                enabled = false,
            },
            indent = {
                char = "│",
                tab_char = "│",
            },
        })
    end
}
