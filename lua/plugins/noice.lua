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
            cmdline = { enabled = false, },
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                },
            },
            messages = { enabled = false, },
            popupmenu = { enabled = false, },
            presets = {
                inc_rename = true,
                lsp_doc_border = true,
            },
        })
    end
}
