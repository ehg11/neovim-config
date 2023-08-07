local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    },
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',
    'nvim-lualine/lualine.nvim',
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },
    'nvim-treesitter/nvim-treesitter-context',
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = {
            'nvim-lua/plenary.nvim'
        }
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    },
    'lewis6991/gitsigns.nvim',
    'lukas-reineke/indent-blankline.nvim',
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        opts = {},
    },
    {
        'numToStr/Comment.nvim',
        opts = {},
    },
    'ThePrimeagen/harpoon',
    'mbbill/undotree',
    {
        "zbirenbaum/neodim",
        event = "LspAttach",
    },
    {
        'nkakouros-original/numbers.nvim',
        opts = {}
    },
    {
        'folke/persistence.nvim',
        event = 'BufReadPre',
        opts = {}
    },
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    'windwp/nvim-ts-autotag',
    'maxmellon/vim-jsx-pretty',
    {
        'yioneko/nvim-yati',
        branch = '*',
        dependencies = {
            'nvim-treesitter/nvim-treesitter'
        }
    },
    'pocco81/auto-save.nvim',
    {
        'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {},
    },
})
