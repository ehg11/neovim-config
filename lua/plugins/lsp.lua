return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'folke/neodev.nvim',
        'nvim-telescope/telescope.nvim',
        'hrsh7th/cmp-nvim-lsp',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
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

            local telescope = require('telescope.builtin')

            lspMap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
            lspMap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

            lspMap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
            lspMap('gr', telescope.lsp_references, '[G]oto [R]eferences')
            lspMap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
            lspMap('gt', vim.lsp.buf.type_definition, '[G]oto [T]ype Definition')

            lspMap('H', vim.lsp.buf.hover, '[H]over Documentation')
            lspMap('K', vim.lsp.buf.signature_help, '[H]over Signature Documentation')
        end

        local signs = {
            Error = ' ',
            Warn = ' ',
            Hint = '󰌵 ',
            Info = ' ',
        }
        for type, icon in pairs(signs) do
            local hl = 'DiagnosticSign' .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

        require('neodev').setup()
        local capabilities = vim.tbl_deep_extend(
            'force',
            vim.lsp.protocol.make_client_capabilities(),
            require('cmp_nvim_lsp').default_capabilities()
        )
        capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

        local mason = require('mason')
        local mason_lspconfig = require('mason-lspconfig')
        local mason_tool_installer = require('mason-tool-installer')
        mason.setup({
            ui = { border = 'rounded' },
        })

        local servers = {
            clangd = {
                cmd = {
                    'clangd',
                    '--background-index',
                    '--suggest-missing-includes',
                    '--enable-config',
                },
            },
            pyright = {},
            tsserver = {},
            html = {},
            marksman = {},
            cssls = {},
            hls = {},
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
            bashls = {},
            gopls = {},
            jdtls = {},
            rust_analyzer = {},
            sqlls = {},
        }

        mason_lspconfig.setup({
            ensure_installed = vim.tbl_keys(servers),
            automatic_installation = true,
        })

        mason_lspconfig.setup_handlers({
            function(server_name)
                require('lspconfig')[server_name].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = servers[server_name],
                    filetypes = (servers[server_name] or {}).filetypes,
                    cmd = (servers[server_name] or {}).cmd,
                    root_dir = function()
                        return vim.loop.cwd()
                    end,
                })
            end,
        })

        mason_tool_installer.setup({
            ensure_installed = {
                'prettier',
                'stylua',
                'isort',
                'black',
                'clang-format',
                'pylint',
                'eslint_d',
                'cpplint',
            },
        })

        local _border = 'rounded'
        vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = _border,
        })
        vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
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
