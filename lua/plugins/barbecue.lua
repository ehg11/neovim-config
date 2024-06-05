return {
    'utilyre/barbecue.nvim',
    dependencies = {
        'SmiteshP/nvim-navic',
        'nvim-tree/nvim-web-devicons', -- optional dependency
    },
    config = function()
        local barbecue = require('barbecue')
        barbecue.setup({
            create_autocmd = false,
        })

        vim.api.nvim_create_autocmd({
            'WinScrolled',
            'BufWinEnter',
            'CursorHold',
            'InsertLeave',
        }, {
            group = vim.api.nvim_create_augroup(
                'ehg-barbeque-updater',
                { clear = true }
            ),
            callback = function()
                require('barbecue.ui').update()
            end,
        })
    end,
}
