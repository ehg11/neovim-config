return {
    'nvimtools/none-ls.nvim',
    event = 'VeryLazy',
    dependencies = {
        'nvimtools/none-ls-extras.nvim',
        'nvim-lua/plenary.nvim',
    },
    config = function()
        local null_ls = require('null-ls')
        local sources = {
            -- formatting
            null_ls.builtins.formatting.stylua,
            null_ls.builtins.formatting.clang_format,
            null_ls.builtins.formatting.prettierd,
            null_ls.builtins.formatting.isort,
            null_ls.builtins.formatting.black,
            -- linters
            -- require('none-ls.diagnostics.eslint'),
        }

        null_ls.setup({
            sources = sources,
            on_attach = function(client, bufnr)
                if client.supports_method('textDocument/formatting') then
                    vim.api.nvim_create_autocmd('BufWritePre', {
                        group = vim.api.nvim_create_augroup(
                            'ehg_format_on_save',
                            { clear = true }
                        ),
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format()
                        end,
                    })
                end
            end,
        })

        vim.keymap.set(
            { 'n', 'v' },
            '<leader>fm',
            vim.lsp.buf.format,
            { desc = '[F]or[m]at file or range (in visual mode)' }
        )
    end,
}
