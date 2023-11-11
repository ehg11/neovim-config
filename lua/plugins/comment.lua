return {
    'numToStr/Comment.nvim',
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
