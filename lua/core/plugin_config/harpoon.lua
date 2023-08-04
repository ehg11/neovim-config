local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>a', mark.add_file, { desc = '[A]dd Harpoon File' })
vim.keymap.set('n', '<leader>e', ui.toggle_quick_menu, { desc = '[E]dit Harpoon Files'})

vim.keymap.set('n', '<leader>h', function() ui.nav_file(1) end, { desc = 'Goto 1st Harpoon File' })
vim.keymap.set('n', '<leader>j', function() ui.nav_file(2) end, { desc = 'Goto 2nd Harpoon File' })
vim.keymap.set('n', '<leader>k', function() ui.nav_file(3) end, { desc = 'Goto 3rd Harpoon File' })
vim.keymap.set('n', '<leader>l', function() ui.nav_file(4) end, { desc = 'Goto 4th Harpoon File' })
