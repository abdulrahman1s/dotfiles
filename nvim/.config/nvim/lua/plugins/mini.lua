-- Auto pairs
require('mini.pairs').setup()

-- Comment lines
require('mini.comment').setup({
	mappings = {
		comment = "<C-_>", -- CTRL + /
		comment_line = "<C-_>"
	}
})

-- Auto highlight word under cursor
require('mini.cursorword').setup({
	delay = 200
})

require('mini.surround').setup()
