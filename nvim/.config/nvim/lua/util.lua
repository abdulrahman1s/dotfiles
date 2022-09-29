local M = {}

M.map = function(mode, key, action, buf)
	vim.keymap.set(mode, key, action, { silent = true, noremap = true, buffer = buf })
end

M.autocmd = function(event, callback, options)
	local opts = {
		callback = callback
	}

	if options ~= nil then
		opts = vim.tbl_deep_extend("force", opts, options)
	end

	vim.api.nvim_create_autocmd(event, opts)
end


return M
