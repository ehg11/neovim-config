return {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    config = function()
        local persistence = require('persistence')
        persistence.setup()
        vim.api.nvim_set_keymap("n", "<leader>rs", [[<cmd>lua require("persistence").load()<cr>]], {})
    end
}
