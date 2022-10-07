local util = require('lspconfig').util

return {
    root_dir = util.root_pattern("package.json"),
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = 'all',
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = false,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			}
		},
		javascript = {
			inlayHints = {
				includeInlayParameterNameHints = 'all',
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = false,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			}
		}
	},
}
