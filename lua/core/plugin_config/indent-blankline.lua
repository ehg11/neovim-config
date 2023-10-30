require('ibl').setup({})

require('ibl').overwrite({
    exclude = {
        filetypes = {
            'help',
            'dashboard',
            'NvimTree',
            'Trouble',
            'mason',
            'toggleterm',
        }
    },
    scope = {
        enabled = false,
    },
    indent = {
      char = "│",
      tab_char = "│",
    },
})
