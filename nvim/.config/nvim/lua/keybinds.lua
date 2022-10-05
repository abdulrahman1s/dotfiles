local map = require('util').map

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

-- Move line up and down in NORMAL and VISUAL modes
map('n', '<C-j>', '<CMD>move .+1<CR>')
map('n', '<C-k>', '<CMD>move .-2<CR>')
map('x', '<C-j>', ":move '>+1<CR>gv=gv")
map('x', '<C-k>', ":move '<-2<CR>gv=gv")
