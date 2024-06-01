return {
    'windwp/nvim-ts-autotag',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
    },
    config = function()
        local autotag = require('nvim-ts-autotag')
        autotag.setup({
            opts = {
                enable_close = true,
                enable_rename = true,
                enable_close_on_slash = true,
            },
        })

        vim.lsp.handlers['textDocument/publishDiagnostics'] =
            vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                underline = true,
                virtual_text = {
                    spacing = 5,
                    severity_limit = 'Warning',
                },
                update_in_insert = true,
            })
    end,
}
