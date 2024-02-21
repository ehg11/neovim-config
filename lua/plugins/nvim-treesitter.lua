return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "windwp/nvim-ts-autotag",
    },
    config = function()
        -- import nvim-treesitter plugin
        local treesitter = require("nvim-treesitter.configs")

        -- configure treesitter
        treesitter.setup({ -- enable syntax highlighting
            highlight = {
                enable = true,
            },
            -- enable indentation
            indent = { enable = true },
            -- enable autotagging (w/ nvim-ts-autotag plugin)
            autotag = {
                enable = true,
            },
            -- ensure these language parsers are installed
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "css",
                "dockerfile",
                "gitignore",
                "html",
                "javascript",
                "jsdoc",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "sql",
                "tsx",
                "typescript",
                "vim",
                "yaml",
            },
            context_commentstring = {
                enable = true,
                enable_autocmd = false,
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ['aa'] = '@parameter.outer',
                        ['ia'] = '@parameter.inner',
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['ac'] = '@class.outer',
                        ['ic'] = '@class.inner',
                    },
                },
            },
        })
    end,
}
