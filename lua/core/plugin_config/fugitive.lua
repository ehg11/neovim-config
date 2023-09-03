vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = 'Git: Open Fugitive'})

local FugitiveAutoGroup = vim.api.nvim_create_augroup('FugitiveAutoGroup', {})
vim.api.nvim_create_autocmd('BufWinEnter', {
    group = FugitiveAutoGroup,
    pattern = '*',
    callback = function()
        if vim.bo.ft ~= 'fugitive' then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local function opts(desc)
            return { buffer = bufnr, remap = false, desc = 'Git:' .. desc }
        end

        vim.keymap.set('n', '<leader>c', function()
            vim.cmd.Git('commit')
        end, opts('Commit Staged'))

        vim.keymap.set('n', '<leader>c', function()
            vim.cmd.Git('commit', '-a')
        end, opts('Commit All'))

        vim.keymap.set('n', '<leader>p', function()
            vim.cmd.Git('push')
        end, opts('Push'))

        vim.keymap.set('n', '<leader>P', function()
            vim.cmd.Git({'pull', '--rebase'})
        end, opts('Pull and Rebase'))
    end
})
