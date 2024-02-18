require('core')

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

if vim.g.vscode then
    require('lazy').setup({
        {
            'kylechui/nvim-surround',
            version = '*',
            event = 'VeryLazy',
            config = function()
                local surround = require('nvim-surround')
                surround.setup({ })
            end
        },
    })
else
    require('lazy').setup('plugins', {
        checker = {
            enabled = true,
            notify = false,
        },
        change_detection = {
            notify = false,
        },
    })
end

