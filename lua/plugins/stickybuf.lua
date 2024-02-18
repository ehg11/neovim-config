return {
    'stevearc/stickybuf.nvim',
    event = 'VeryLazy',
    config = function()
        local stickybuf = require('stickybuf')
        stickybuf.setup()
    end
}
