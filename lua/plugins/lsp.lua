return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'folke/neodev.nvim',
        'nvim-telescope/telescope.nvim',
        'hrsh7th/cmp-nvim-lsp',
        'mason-org/mason-lspconfig.nvim',
    },
    config = function()
        local mason_lspconfig = require('mason-lspconfig')
        local cmp_nvim_lsp = require('cmp_nvim_lsp')
        local neodev = require('neodev')
        local telescope = require('telescope.builtin')

        neodev.setup()
        mason_lspconfig.setup({
            ensure_installed = {
                -- C/C++
                'clangd',

                -- Python
                'pyright',
                'basedpyright',
                'pylsp',
                'pylyzer',
                'ruff',

                -- Lua
                'lua_ls',

                -- TS/JS/React
                'ts_ls',
                'eslint',
                'vtsls',
                'biome',

                -- Markdown
                'marksman',
                'ltex',
                'prosemd_lsp',
                'textlsp',

                -- Shell
                'bashls',
            },
            automatic_enable = true,
        })

        local on_attach = function(_, bufnr)
            local lspMap = function(keys, func, desc)
                if desc then
                    desc = 'LSP: ' .. desc
                end
                vim.keymap.set('n', keys, func, {
                    buffer = bufnr,
                    desc = desc,
                    silent = true,
                    noremap = true,
                })
            end

            lspMap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
            lspMap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

            lspMap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
            lspMap('gr', telescope.lsp_references, '[G]oto [R]eferences')
            lspMap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
            lspMap(
                'gt',
                vim.lsp.buf.type_definition,
                '[G]oto [T]ype Definition'
            )
        end

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('ehg_lsp_config', {}),
            callback = on_attach,
        })

        local capabilities = vim.tbl_deep_extend(
            'force',
            vim.lsp.protocol.make_client_capabilities(),
            cmp_nvim_lsp.default_capabilities()
        )
        capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

        local signs = {
            Error = ' ',
            Warn = ' ',
            Hint = '󰠠 ',
            Info = ' ',
        }
        for type, icon in pairs(signs) do
            local hl = 'DiagnosticSign' .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

        local servers = {
            clangd = {
                cmd = {
                    'clangd',
                    '--background-index',
                    '--suggest-missing-includes',
                    '--enable-config',
                    '--offset-encoding=utf-16',
                },
            },
            pyright = {},
            tsserver = {},
            html = {},
            cssls = {},
            lua_ls = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' },
                        disable = { 'missing-fields' },
                    },
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            },
            gopls = {},
            rust_analyzer = {},
        }

        local _border = 'rounded'
        vim.lsp.handlers['textDocument/hover'] =
            vim.lsp.with(vim.lsp.handlers.hover, {
                border = _border,
            })
        vim.lsp.handlers['textDocument/signatureHelp'] =
            vim.lsp.with(vim.lsp.handlers.signature_help, {
                border = _border,
            })
        vim.diagnostic.config({
            float = { border = _border },
        })
        require('lspconfig.ui.windows').default_options = {
            border = _border,
        }
    end,
}
