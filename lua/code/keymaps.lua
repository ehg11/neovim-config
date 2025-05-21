local map = vim.keymap.set
local unmap = vim.keymap.del
local vscode = require("vscode")

-- clear search
map({ "i", "n", "s" }, "<esc>", function()
  vim.cmd("noh")
  return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch", silent = true })

-- better indenting
map("v", "<", "<gv", { silent = true })
map("v", ">", ">gv", { silent = true })

map("n", "J", "mzJ`z", { silent = true })
map("v", "y", "ygv<Esc>", { silent = true })
map({ "v", "x" }, "p", '"_dP', { silent = true })
map("n", "x", '"_x', { silent = true })

function Smart_dd()
    if vim.api.nvim_get_current_line():match('^%s*$') then
        return '"_dd'
    else
        return 'dd'
    end
end

map(
    'n',
    'dd',
    Smart_dd,
    { noremap = true, expr = true, silent = true }
)

-- Alt + h → Previous tab
map("n", "<A-h>", function()
    vscode.action("workbench.action.previousEditorInGroup")
end, { silent = true })

-- Alt + l → Next tab
map("n", "<A-l>", function()
    vscode.action("workbench.action.nextEditorInGroup")
end, { silent = true })

-- Alt + w → Close tab
map("n", "<A-w>", function()
    vscode.action("workbench.action.closeActiveEditor")
end, { silent = true })

map("x", "J", ":move '>+1<CR>gv=gv", { noremap = true, silent = true })
map("x", "K", ":move '<-2<CR>gv=gv", { noremap = true, silent = true })

map("x", "=", function()
    vscode.action("editor.action.formatSelection")
end, { silent = true })

map("n", "==", function()
    vscode.action("editor.action.formatSelection", {
        range = {
            vim.fn.line(".") - 1,
            vim.fn.line(".") - 1,
        },
    })
end, { silent = true })

map("n", "K", function()
    vscode.action("editor.action.showHover")
end, { silent = true })

-- Go to definition
map("n", "gd", function()
    vscode.action("editor.action.revealDefinition")
end, { silent = true, desc = "Go to Definition" })

-- Show references
map("n", "gr", function()
    vscode.action("editor.action.referenceSearch.trigger")
end, { silent = true, desc = "Show References" })