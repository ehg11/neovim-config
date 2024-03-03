return {
    'folke/todo-comments.nvim',
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        local todoComments = require('todo-comments')
        todoComments.setup({
            signs = false
        })
    end
}
