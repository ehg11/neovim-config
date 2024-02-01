return {
    'f-person/git-blame.nvim',
    event = 'VeryLazy',
    config = function()
        local blame = require('gitblame')
        blame.setup({
            enabled = false,
        })

        vim.keymap.set('n', '<leader>gb', '<cmd>GitBlameToggle<cr>', {
            desc = 'Toggle [G]it [B]lame',
            silent = true,
            noremap = true,
        })
    end
}
