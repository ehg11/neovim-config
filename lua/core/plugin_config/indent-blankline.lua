require('ibl').setup({})

require('ibl').overwrite({
    exclude = {
        filetypes = {
            'help',
            'dashboard',
            'NvimTree',
            'Trouble'
        }
    },
    scope = {
        enabled = false,
    }
})
