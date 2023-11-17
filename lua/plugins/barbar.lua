return {
    'romgrk/barbar.nvim',
    dependencies = {
        'lewis6991/gitsigns.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
    config = function()
        local barbar = require('barbar')
        barbar.setup({
            no_name_title = '[No Name]',
        })
        function BarbarMap(mode, keybind, action, desc)
            vim.api.nvim_set_keymap(mode, keybind, action, { desc = desc, noremap = true, silent = true })
        end

        -- Move to previous/next
        BarbarMap('n', '<M-l>', '<Cmd>BufferNext<CR>', 'Goto Next Tab')
        BarbarMap('n', '<M-h>', '<Cmd>BufferPrevious<CR>', 'Goto Previous Tab')

        -- Re-order to previous/next
        BarbarMap('n', '<M-<>', '<Cmd>BufferMovePrevious<CR>', 'Move Tab Left')
        BarbarMap('n', '<M->>', '<Cmd>BufferMoveNext<CR>', 'Move Tab Right')
        -- more ergonomic keybinds for reordering
        BarbarMap('n', '<M-k>', '<Cmd>BufferMovePrevious<CR>', 'Move Tab Left')
        BarbarMap('n', '<M-j>', '<Cmd>BufferMoveNext<CR>', 'Move Tab Right')

        -- like harpoon
        BarbarMap('n', '<leader>h', '<Cmd>BufferGoto 1<CR>', 'Goto Tab 1')
        BarbarMap('n', '<leader>j', '<Cmd>BufferGoto 2<CR>', 'Goto Tab 2')
        BarbarMap('n', '<leader>k', '<Cmd>BufferGoto 3<CR>', 'Goto Tab 3')
        BarbarMap('n', '<leader>l', '<Cmd>BufferGoto 4<CR>', 'Goto Tab 4')

        -- Goto buffer in position...
        BarbarMap('n', '<M-1>', '<Cmd>BufferGoto 1<CR>', 'Goto Tab 1')
        BarbarMap('n', '<M-2>', '<Cmd>BufferGoto 2<CR>', 'Goto Tab 2')
        BarbarMap('n', '<M-3>', '<Cmd>BufferGoto 3<CR>', 'Goto Tab 3')
        BarbarMap('n', '<M-4>', '<Cmd>BufferGoto 4<CR>', 'Goto Tab 4')
        BarbarMap('n', '<M-5>', '<Cmd>BufferGoto 5<CR>', 'Goto Tab 5')
        BarbarMap('n', '<M-6>', '<Cmd>BufferGoto 6<CR>', 'Goto Tab 6')
        BarbarMap('n', '<M-7>', '<Cmd>BufferGoto 7<CR>', 'Goto Tab 7')
        BarbarMap('n', '<M-8>', '<Cmd>BufferGoto 8<CR>', 'Goto Tab 8')
        BarbarMap('n', '<M-9>', '<Cmd>BufferGoto 9<CR>', 'Goto Tab 9')
        BarbarMap('n', '<M-0>', '<Cmd>BufferLast<CR>', 'Goto Last Tab')

        -- close tab
        BarbarMap('n', '<M-w>', '<Cmd>BufferClose<CR>', 'Close Tab')

        -- Magic buffer-picking mode
        BarbarMap('n', '<M-p>', '<Cmd>BufferPick<CR>', 'Pick Tab')
    end,
}
