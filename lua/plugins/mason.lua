return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
        local mason = require('mason')
        local mason_lspconfig = require('mason-lspconfig')
        local mason_tool_installer = require('mason-tool-installer')

        mason.setup({
            ui = { border = 'rounded' },
        })

        mason_lspconfig.setup({
            ensure_installed = {
                'clangd',
                'cssls',
                'gopls',
                'html',
                'lua_ls',
                'pyright',
                'rust_analyzer',
                'ts_ls',
            },
            automatic_installation = true,
        })

        mason_tool_installer.setup({
            'prettier',
            'stylua',
            'isort',
            'black',
            'clang-format',
            'pylint',
            'eslint_d',
            'cpplint',
        })
    end,
}
