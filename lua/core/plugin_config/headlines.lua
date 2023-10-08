require('headlines').setup({
    markdown = {
        headline_highlights = false,
        codeblock_highlight = "CodeBlock",
        dash_highlight = "Dash",
        dash_string = "-",
        quote_highlight = "Quote",
        quote_string = "┃",
        fat_headline_lower_string = "🬂",
    },
})

vim.api.nvim_create_autocmd('FileType', {
    callback = function()
        vim.opt_local.conceallevel = 2
        vim.opt_local.spell = true

        vim.keymap.set('n', '<leader>sp', 'z=', { noremap = true, silent = true, desc = '[Sp]ell Check'})
    end,
    group = vim.api.nvim_create_augroup('MarkdownAutoCmd', { clear = true }),
    pattern = 'markdown',
})
