return {
    'f-person/git-blame.nvim',
    keys = {
        {
            '<leader>gb',
            '<cmd>GitBlameToggle<cr>',
            desc = 'Toggle [G]it [B]lame',
            slient = true,
            noremap = true,
        },
    },
    config = function()
        local blame = require('gitblame')
        blame.setup({
            enabled = false,
        })
    end,
}
