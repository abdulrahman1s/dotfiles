local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true, noremap = true })
end

-- CTRL + Q to quit
map('n', '<C-Q>', '<CMD>q<CR>')

-- Open file finder
map('n', '<leader>\\', '<CMD>Telescope find_files<CR>')

map('n', '<leader><tab>', '<CMD>NvimTreeToggle<CR>')

-- Move line up and down in NORMAL and VISUAL modes
map('n', '<C-j>', '<CMD>move .+1<CR>')
map('n', '<C-k>', '<CMD>move .-2<CR>')
map('x', '<C-j>', ":move '>+1<CR>gv=gv")
map('x', '<C-k>', ":move '<-2<CR>gv=gv")

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

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})
