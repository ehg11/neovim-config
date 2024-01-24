return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'folke/neodev.nvim',
        'nvim-telescope/telescope.nvim',
        'hrsh7th/cmp-nvim-lsp',
        { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
    },
    config = function ()
        local on_attach = function(_, bufnr)
            local lspMap = function(keys, func, desc)
                if desc then
                    desc = 'LSP: '..desc
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

            lspMap('<leader>gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
            lspMap('<leader>gr', telescope.lsp_references, '[G]oto [R]eferences')
            lspMap('<leader>gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
            lspMap('<leader>gt', vim.lsp.buf.type_definition, '[G]oto [T]ype Definition')

            lspMap('H', vim.lsp.buf.hover, '[H]over Documentation')
            lspMap('<leader>h', vim.lsp.buf.signature_help, '[H]over Signature Documentation')
        end

        local signs = {
            Error = " ",
            Warn  = " ",
            Hint  = " ",
            Info  = " ",
        }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

        require('mason').setup()
        require('mason-lspconfig').setup()

        local servers = {
            clangd = {},
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

        require('neodev').setup()

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        local mason_lspconfig = require('mason-lspconfig')

        mason_lspconfig.setup({
            ensure_installed = vim.tbl_keys(servers),
        })

        mason_lspconfig.setup_handlers({
            function(server_name)
                require('lspconfig')[server_name].setup {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = servers[server_name],
                    filetypes = (servers[server_name] or {}).filetypes,
                    root_dir = function()
                        return vim.loop.cwd()
                    end
                }
            end,
        })
    end
}
