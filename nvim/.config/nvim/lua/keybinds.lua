local map = require('util').map
local sts = require("syntax-tree-surfer")

-- CTRL + Q to quit
map('n', '<C-Q>', '<CMD>q<CR>')

-- Open file finder
map('n', '<leader>e', '<CMD>NvimTreeToggle<CR>')


-- Telescope hotkeys
map('n', 'ff', '<CMD>Telescope find_files<CR>')
map('n', 'fe', '<CMD>Telescope emoji<CR>')
map('n', 'fr', '<CMD>Telescope lsp_references<CR>')
map('n', 'fd', '<CMD>Telescope diagnostics<CR>')
map('n', 'fc', '<CMD>Telescope command_center<CR>')
map('n', 'fn', '<CMD>Telescope notify<CR>')

-- Visual Selection from Normal Mode
map("n", "vx", '<cmd>STSSelectMasterNode<cr>')
map("n", "vn", '<cmd>STSSelectCurrentNode<cr>')

-- Select Nodes in Visual Mode
map("x", "J", '<cmd>STSSelectNextSiblingNode<cr>')
map("x", "K", '<cmd>STSSelectPrevSiblingNode<cr>')
map("x", "H", '<cmd>STSSelectParentNode<cr>')
map("x", "L", '<cmd>STSSelectChildNode<cr>')

-- Swapping Nodes in Visual Mode and Normal Mode (Up/Down)
map("x", "<C-k>", '<cmd>STSSwapPrevVisual<cr>')
map("x", "<C-j>", '<cmd>STSSwapNextVisual<cr>')
map("n", "<C-k>", '<cmd>STSSwapUpNormal<cr>')
map("n", "<C-j>", '<cmd>STSSwapDownNormal<cr>')


-- Swapping Nodes in Normal Mode (Left/Right)
map("n", "<C-h>", '<cmd>STSSwapCurrentNodePrevNormal<cr>')
map("n", "<C-l>", '<cmd>STSSwapCurrentNodeNextNormal<cr>')



map("n", "gv", function() -- only jump to variable_declarations
    sts.targeted_jump({ "variable_declaration" })
end)
map("n", "gfu", function() -- only jump to functions
    sts.targeted_jump({ "function", "arrrow_function", "function_definition" })
end)
map("n", "gif", function() -- only jump to if_statements
    sts.targeted_jump({ "if_statement" })
end)
map("n", "gfo", function() -- only jump to for_statements
    sts.targeted_jump({ "for_statement" })
end)


map("n", "<A-j>", function()
    sts.filtered_jump("default", true) --> true means jump forward
end)
map("n", "<A-k>", function()
    sts.filtered_jump("default", false) --> false means jump backwards
end)
