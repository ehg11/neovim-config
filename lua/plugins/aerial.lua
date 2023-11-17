return {
    'stevearc/aerial.nvim',
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    config = function ()
        local aerial = require('aerial')
        aerial.setup({
            on_attach = function(bufnr)
                local opts = { buffer = bufnr, silent = true, noremap = true }
                vim.keymap.set('n', '}', '<cmd>AerialNext<cr>', opts)
                vim.keymap.set('n', '{', '<cmd>AerialPrev<cr>', opts)
            end
        })

        vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<cr>', {
            desc = 'Toggle [A]erial',
            silent = true,
            noremap = true,
        })
    end
}
