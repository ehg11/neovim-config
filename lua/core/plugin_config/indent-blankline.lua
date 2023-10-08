require('ibl').setup({
    show_trailing_blankline_indent = false,
})

require('ibl').overwrite({
    exclude = {
        filetypes = {
            'help',
            'dashboard',
            'NvimTree',
            'Trouble'
        }
    },
    scope = {
        enabled = false,
    }
})
