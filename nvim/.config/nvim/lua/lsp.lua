require('mason').setup()
local installer = require('mason-lspconfig')
local lsp = require('lspconfig')
local coq = require('coq')

local servers = { "sumneko_lua", "tsserver", "jsonls", "bashls" }

installer.setup({
	ensure_installed = servers,
	automatic_installation = true
})


local signs = {
	{ name = 'DiagnosticSignError', text = "" },
	{ name = 'DiagnosticSignWarn', text = "" },
	{ name = 'DiagnosticSignHint', text = "" },
	{ name = 'DiagnosticSignInfo', text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end


vim.diagnostic.config({
	virtual_text = false,
	-- show signs
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
	width = 60,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
	width = 60,
	close_events = { "CursorMoved", "BufHidden", "InsertCharPre" }
})



for _, server in pairs(servers) do
	local opts = {
		on_attach = function(client, bufnr)
			local function map(m, k, cmd)
				vim.keymap.set(m, k, cmd, { noremap = true, silent = true, buffer = bufnr })
			end

			map('n', 'D', vim.diagnostic.open_float)

			map('n', 'K', vim.lsp.buf.hover)

			-- Format
			map('n', '<leader>f', vim.lsp.buf.formatting)

			-- Code Action
			map('n', '<leader>ca', vim.lsp.buf.code_action)

			-- Rename
			map('n', '<leader>rn', vim.lsp.buf.rename)


			if client.server_capabilities.documentHighlightProvider then
				local group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
				vim.api.nvim_create_autocmd("CursorHold", {
					callback = vim.lsp.buf.document_highlight,
					buffer = bufnr,
					group = group
				})
				vim.api.nvim_create_autocmd("CursorMoved", {
					callback = vim.lsp.buf.clear_references,
					buffer = bufnr,
					group = group,
				})
			end
		end,
		capabilities = vim.lsp.protocol.make_client_capabilities()
	}

	opts.capabilities.textDocument.completion.completionItem = {
		documentationFormat = { "markdown", "plaintext" },
		snippetSupport = true,
		preselectSupport = true,
		insertReplaceSupport = true,
		labelDetailsSupport = true,
		deprecatedSupport = true,
		commitCharactersSupport = true,
		tagSupport = { valueSet = { 1 } },
		resolveSupport = {
			properties = {
				"documentation",
				"detail",
				"additionalTextEdits",
			},
		},
	}

	local has_custom_opts, server_custom_opts = pcall(require, "lsp_settings." .. server)

	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end

	lsp[server].setup(coq.lsp_ensure_capabilities(opts))
end
