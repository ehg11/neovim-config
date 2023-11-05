-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup({
    diagnostics = {
        enable = true,
        icons = {
            error = " ",
            warning = " ",
            hint = " ",
            info = " ",
        },
    },
    git = {
        enable = true,
    },
    filters = {
        git_ignored = false,
    }
})

vim.keymap.set('n', '<C-n>', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true, desc = 'Open File Tree'})
