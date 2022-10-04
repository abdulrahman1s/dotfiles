local telescope = require('telescope')


telescope.setup({
	extensions = {
		emoji = {
			action = function(emoji)
				vim.api.nvim_put({ emoji.value }, 'c', false, true)
			end,
		}
	},
})

telescope.load_extension('emoji')
-- telescope.load_extension('fzy_native')
