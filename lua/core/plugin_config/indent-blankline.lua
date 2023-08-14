require('indent_blankline').setup({
    show_trailing_blankline_indent = false,
})

vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_filetype_exclude = {
    'help',
    'dashboard',
    'NvimTree',
    'Trouble'
}
