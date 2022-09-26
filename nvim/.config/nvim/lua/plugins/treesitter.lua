require('nvim-treesitter.configs').setup({
		auto_install = true,
		ensure_installed = {
				'lua',
				'javascript',
				'typescript',
				'css',
				'json',
				'bash',
				'html',
				'markdown',
				'rust'
		},
		highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
				use_languagetree = true
		},
		indent = {
				enable = true,
		},
})

