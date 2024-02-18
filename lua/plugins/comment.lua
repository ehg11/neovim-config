return {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    config = function()
        local comment = require('Comment')
        comment.setup({
            toggler = {
                line = '<C-_>',
                block = '<M-/>',
            },
            opleader = {
                line = '<C-_>',
                block = '<M-/>',
            },
        })
    end
}
