vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({
		transparent_background = true,
		integrations = {
				telescope = true
		}
})

vim.cmd[[colorscheme catppuccin]] 
