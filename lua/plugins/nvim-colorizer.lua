return {
    'NvChad/nvim-colorizer.lua',
    config = function()
        local colorizer = require('colorizer')
        colorizer.setup({
            filetypes = {
                'css',
                'html',
                'js',
                'jsx',
                'ts',
                'tsx',
            },
            user_default_options = {
                rgb_fn = true,
                hsl_fn = true,
                css = true,
                css_fn = true,
                tailwind = true,
            }
        })
    end,
}
