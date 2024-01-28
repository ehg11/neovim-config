return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local dashboard = require('dashboard')
        dashboard.setup({
            theme = 'doom',
            config = {
                -- https://lachlanarthur.github.io/Braille-ASCII-Art/
                header = {
                    "",
                    "",
                    "",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣟⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠐⢶⣤⣄⠀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⣤⣄⣀⣼⢿⣿⣻⣿⣿⣿⣿⣿⣿⣿⣥⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⣿⡊⣛⠿⣿⣿⣿⣷⣦⡄⠀⠠⢴⡖⠈⢀⣀⡀⠉⠙⠻⣿⣷⣮⣟⡿⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠋⣼⣿⣿⣮⣷⡞⣻⠟⠀⢀⠀⠸⠟⠛⠛⠛⠋⠁⠀⠒⠦⣝⣿⣿⣿⣾⣜⢿⣿⣿⡟⠉⠀⠀⠤⣀⡀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠠⣾⣿⣿⣿⣿⣿⢟⡼⣣⠴⢫⣿⡇⠀⢀⣀⣀⣄⣠⣤⣤⣤⣤⣀⡉⢹⣿⣿⣿⣷⣝⢛⣫⣷⣦⡀⠀⠀⠈⠑⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣻⡧⡀⠀⠀⣿⣿⣷⡹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⡷⣛⣿⣿⣿⣷⡽⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⢀⣾⣯⣽⡿⣽⣿⡟⢀⢰⣿⣾⣻⠿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢽⣿⢿⣿⣿⣿⣾⣿⣿⣿⣆⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠉⠛⠟⢱⣿⣿⡁⣼⣾⣿⣿⣿⣿⣷⣮⣭⣍⣛⣛⣛⠛⠛⠛⠛⠉⢉⣉⣠⣴⣾⣿⣿⣿⣿⡿⣿⣿⣿⣆⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⢀⠀⠀⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⢈⠻⣿⣿⣯⣿⠿⣹⣺⣿⣿⣿⣿⣹⣿⣿⣿⡀⠀⠀⠀",
                    "⠀⠀⠀⠀⠂⠁⠀⢸⣿⣿⣿⣿⢹⣿⣿⣿⣿⣿⣎⠻⣿⡿⣿⣿⣿⣿⣿⠸⠿⣮⣛⢿⢎⢟⠆⣛⢿⣿⣿⣿⣇⣿⣿⣿⣇⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠐⣼⣿⣿⣿⣿⡏⢿⣿⣿⣿⣿⣿⣷⣬⣧⣹⣿⣿⡿⢞⣸⣿⣿⣿⣧⡃⢾⡇⣶⣿⣿⡏⣿⣿⢸⣿⣿⣿⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠆⢻⣿⣼⣬⣿⡿⣨⢿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⠿⢋⣿⡿⠿⠛⠛⠋⠂⠙⢻⣿⣿⡇⢻⣿⡞⣿⣿⣿⡄⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⡹⣷⠿⣣⣝⠿⣿⣿⣿⣿⣷⠦⢴⣶⠎⣾⠍⡀⠀⠀⠀⠀⣶⠀⣸⣿⣿⡇⢸⣿⡇⣿⣿⡼⡇⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⠸⡿⣿⣿⣧⢿⢺⣿⣿⣿⣶⣭⣙⣛⠻⠿⠶⠭⠌⢛⣺⣧⠐⣤⣼⢄⡟⡄⣿⣿⣿⠀⣿⣿⡇⢹⣿⣝⠁⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⢿⢻⣿⣿⣞⠘⠛⠁⠀⠀⠀⠉⠿⡿⢛⣥⣾⣿⣿⣿⣿⣷⣽⣿⣾⢟⣽⣿⣿⠃⣰⣿⣿⡇⣎⣿⣿⣦⣀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⠘⡆⠸⣿⣿⡄⠀⣼⡆⠀⢤⣀⢾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠣⠾⢛⠟⠁⠀⣏⣿⠿⣆⠻⣿⣿⣯⠛⠿",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⣠⣽⡤⠌⢿⣮⡀⠹⣿⣦⣫⣽⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣭⣤⡀⠀⠀⠀⣹⣿⡇⠙⢦⣙⢿⣿⣷⣄",
                    "⠀⠀⣀⣀⣦⢋⢠⣾⠋⢖⣽⡟⣳⠎⠹⣷⣞⣉⢽⣿⣿⣿⣿⠛⠋⢉⣉⣁⣸⣿⣿⣿⣿⡯⠁⠀⠀⠀⠿⠿⠃⢢⡀⠈⠁⠈⠙⠿",
                    "⣾⣟⣛⡏⣿⣌⣿⡇⣴⣿⣷⢁⣛⣓⡄⠀⠈⠉⣁⣾⣿⣿⣿⣧⡰⣿⣿⣿⣿⣿⣟⣛⠋⢀⣀⣤⣪⣤⡔⡕⠀⠈⠻⢧⡢⠤⣀⠀",
                    "⣿⣿⡿⣽⣿⣿⣿⣿⣿⣯⣷⠟⠹⣶⣝⠑⣤⠈⠙⠻⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡷⣰⣿⣿⣷⣿⣿⣻⠁⠀⠀⠀⠐⠬⣠⣤⣾",
                    "⠉⠉⣸⣿⣿⣿⣿⣿⣿⣿⡇⠀⡀⠙⠿⠃⠈⠁⠓⠦⠄⢙⠋⠿⠿⢿⣿⣿⡿⠟⢁⠀⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⢀⣴⣿⣿⡿",
                    "⢦⠀⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⣵⠆⣴⡎⣿⣷⠀⣠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⣾⣿⣿⣍⠨",
                    "⠈⠿⣾⣽⣿⣿⣿⣿⣿⣿⣶⣶⠟⠀⢹⣿⡸⣿⣷⣿⣿⣆⢆⣤⠀⡀⠀⠀⢠⠀⠀⡀⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⢸⣿⣩⣻⣿⣿",
                    "⠀⠀⠀⠉⠉⠛⠈⠉⠛⠛⠉⠀⠀⠀⢄⣿⣷⡹⣿⣿⣿⣿⣎⠉⠁⠀⠀⠀⠀⠀⠚⠁⢻⣿⣿⡿⣿⣿⢙⡄⠀⠀⢈⣿⣿⢿⣿⣿",
                    "",
                    "               ━━━━━━  ❖❖  ━━━━━━               ",
                    "",
                },
                center = {
                    {
                        icon = '  ',
                        icon_hl = 'Title',
                        desc = 'Open Last Session   ',
                        desc_hl = 'String',
                        key = 'r',
                        keymap = 'SPC r s',
                        key_hl = 'Number',
                        action = 'lua require("persistence").load({})'
                    },
                    {
                        icon = '  ',
                        icon_hl = 'Title',
                        desc = 'Open New File       ',
                        desc_hl = 'String',
                        key = 'n',
                        keymap = 'SPC n f',
                        key_hl = 'Number',
                        action = 'enew'
                    },
                    {
                        icon = '  ',
                        icon_hl = 'Title',
                        desc = 'Git                 ',
                        desc_hl = 'String',
                        key = 'g',
                        keymap = 'SPC l g',
                        key_hl = 'Number',
                        action = 'lua _lazygit_toggle()',
                    },
                    {
                        icon = '  ',
                        icon_hl = 'Title',
                        desc = 'Config              ',
                        desc_hl = 'String',
                        key = 'c',
                        key_hl = 'Number',
                        action = 'e ~/.config/nvim'
                    }
                }
            },
        })
        vim.cmd([[highlight DashboardHeader guifg=pink]])
    end,
}