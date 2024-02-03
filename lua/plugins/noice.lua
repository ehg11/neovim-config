return {
    'folke/noice.nvim',
    dependencies = {
        "MunifTanjim/nui.nvim",
        "hrsh7th/nvim-cmp",
    },
    event = 'VeryLazy',
    config = function()
        local noice = require('noice')
        noice.setup({
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                },
            },
            notify = {
                enabled = false,
                view = "popup"
            },
            presets = {
                command_palette = true,
                lsp_doc_border = true,
            },
        })
    end
}
