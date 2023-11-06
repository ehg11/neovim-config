require('treesitter-context').setup({
    on_attach = function ()
        local filetype = vim.bo.filetype
        if filetype == 'markdown' then
            return false
        else
            return true
        end
    end,
})
