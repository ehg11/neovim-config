return {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    config = function()
        local persistence = require('persistence')
        persistence.setup()

        vim.keymap.set('n', '<leader>rs', function() persistence.load() end, {
            desc = '[R]estore [S]esssion',
            silent = true,
            noremap = true,
        })
    end
}
