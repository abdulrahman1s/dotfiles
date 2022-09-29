local autocmd = require('util').autocmd

-- Auto save
autocmd({ "InsertLeave", "TextChanged" }, function()
	local buf = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_call(buf, function() vim.cmd("silent! write") end)
end)


autocmd("BufEnter", function()
	if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
		vim.cmd("quit")
	end
end)
