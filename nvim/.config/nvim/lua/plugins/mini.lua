-- Comment lines
require('mini.comment').setup({
	mappings = {
		comment = "<C-_>", -- CTRL + /
		comment_line = "<C-_>"
	}
})

-- To change quotes to whatever I want
require('mini.surround').setup()
