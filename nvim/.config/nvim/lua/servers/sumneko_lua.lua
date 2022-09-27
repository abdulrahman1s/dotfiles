return {
	settings = {
		Lua = {
          completion = {
                enable = true,
                showWord = 'Disable',
                -- keywordSnippet = 'Disable',
            },
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
                library = { os.getenv('VIMRUNTIME') },
			},
			telemetry = {
				enable = false
			},
		},
	},
}
