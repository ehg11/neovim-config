return {
    'echasnovski/mini.ai',
    version = '*',
    config = function()
        local ai = require('mini.ai')
        ai.setup({
            custom_textobjects = {
                o = ai.gen_spec.treesitter({ -- code block
                    a = { "@block.outer", "@conditional.outer", "@loop.outer" },
                    i = { "@block.inner", "@conditional.inner", "@loop.inner" },
                }),
                f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
               c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
            }
        })
    end,
}

