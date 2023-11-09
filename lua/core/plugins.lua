-- Lazy plugin manager
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

-- plugins
require('lazy').setup({
    -- themes
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
    },
    'nvim-tree/nvim-web-devicons',
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        }
    },
    'lewis6991/gitsigns.nvim',

    -- file explorer
    'nvim-tree/nvim-tree.lua',

    -- syntax highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },

    -- sticky context bar on tob
    'nvim-treesitter/nvim-treesitter-context',
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = {
            'nvim-lua/plenary.nvim'
        }
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',
            { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
            'folke/neodev.nvim'
        }
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'rafamadriz/friendly-snippets',
        },
    },
    {
        'hrsh7th/cmp-nvim-lsp-signature-help',
        dependencies = {
            'hrsh7th/nvim-cmp',
        }
    },

    -- show indent guids
    { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {}},

    -- auto pair
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        opts = {},
    },

    -- comment functionality
    {
        'numToStr/Comment.nvim',
        opts = {},
    },

    -- surround keybinds
    {
        'kylechui/nvim-surround',
        version = '*',
        event = 'VeryLazy',
    },

    -- quick file navigation
    'ThePrimeagen/harpoon',

    -- dim unused parameters
    {
        "zbirenbaum/neodim",
        event = "LspAttach",
    },

    -- smart numbers (relative normally, basic line nums in insert)
    {
        'nkakouros-original/numbers.nvim',
        opts = {}
    },

    -- saving session (by directory)
    {
        'folke/persistence.nvim',
        event = 'BufReadPre',
        opts = {}
    },

    -- terminal inside editor
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true
    },

    -- automatically change tag
    'windwp/nvim-ts-autotag',

    -- improve jsx indenting
    'maxmellon/vim-jsx-pretty',
    {
        'yioneko/nvim-yati',
        dependencies = {
            'nvim-treesitter/nvim-treesitter'
        }
    },

    -- diagnostics menu
    {
        'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {},
    },

    -- tabs
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            insert_at_start = false,
            no_name_title = '[No Name]',
            auto_hide = 1,
        },
        version = '^1.0.0', -- optional: only update when a new 1.x version is released
    },

    -- autosave, I know, I suck
    "pocco81/auto-save.nvim",

    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        }
    },

    -- I prefer lazy git, but lazy git requires other stuff to be installed...
    'tpope/vim-fugitive',

    -- better disambiguation for markdown code blocks
    {
        'lukas-reineke/headlines.nvim',
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true, -- or `opts = {}
    },

    'tpope/vim-sleuth',

    'Aasim-A/scrollEOF.nvim',
})
