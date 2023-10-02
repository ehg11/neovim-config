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
    end,
    group = vim.api.nvim_create_augroup('MarkdownConceal', { clear = true }),
    pattern = 'markdown',
})
