local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true, noremap = true })
end

-- CTRL + Q to quit
map('n', '<C-Q>', '<CMD>q<CR>')

-- Open file picker
map('n', '<leader>\\', '<CMD>Telescope find_files<CR>')

-- Auto save
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		vim.api.nvim_buf_call(buf, function()
			vim.cmd("silent! write")
		end)
	end,
	pattern = "*",
	group = vim.api.nvim_create_augroup("Autosave", { clear = true })
})
