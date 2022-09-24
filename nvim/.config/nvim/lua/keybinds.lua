local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)

local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true, noremap = true })
end

-- CTRL + Q to quit
map('n', '<C-Q>', '<CMD>q<CR>')

-- Open file picker
map({ 'n', 'v' }, '<leader>\\', '<CMD>Telescope find_files<CR>')

-- Comment current line
map('n', '<C-_>', require('Comment.api').toggle.linewise.current)
-- Comment multi line
map('x', '<C-_>', function()
	vim.api.nvim_feedkeys(esc, 'nx', false)
	require('Comment.api').toggle.linewise(vim.fn.visualmode())
end)
