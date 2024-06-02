return {
    {
        'JoosepAlviste/nvim-ts-context-commentstring',
        lazy = true,
        opts = {
            enable_autocmd = false,
        },
    },
    {
        'echasnovski/mini.comment',
        event = 'VeryLazy',
        opts = {
            options = {
                custom_commentstring = function()
                    local cmt = require('ts_context_commentstring.internal')
                    return cmt.calculate_commentstring() or vim.bo.commentstring
                end,
            },
            mappings = {
                comment = '<C-_>',
                comment_line = '<C-_>',
                comment_visual = '<C-_>',
            },
        },
    },
}
