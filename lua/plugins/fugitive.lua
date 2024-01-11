return {
    'tpope/vim-fugitive',
    config = function()
        vim.keymap.set('n', '<leader>mc', '<cmd>Gvdiffsplit!<cr>', {
            desc = 'Fix [M]erge [C]onflict',
            silent = true,
            noremap = true,
        })
        vim.keymap.set('n', '<leader>ch', '<cmd>diffget //2<cr>', {
            desc = 'Merge [C]onflict Left Option',
            silent = true,
            noremap = true,
        })
        vim.keymap.set('n', '<leader>cl', '<cmd>diffget //3<cr>', {
            desc = 'Merge [C]onflict Right Option',
            silent = true,
            noremap = true,
        })
    end
}
