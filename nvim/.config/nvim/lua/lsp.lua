require("plugins.cmp")
require("mason").setup()
local installer = require('mason-lspconfig')
local lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = { "sumneko_lua", "tsserver", "jsonls" }

installer.setup({
		ensure_installed = servers,
		automatic_installation = true
})


for _, server in pairs(servers) do
		local opts = {
				setup =  function()
						local signs = {
								{ name = "DiagnosticSignError", text = "" },
								{ name = "DiagnosticSignWarn", text = "" },
								{ name = "DiagnosticSignHint", text = "" },
								{ name = "DiagnosticSignInfo", text = "" },
						}

						for _, sign in ipairs(signs) do
								vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
						end

						local config = {
								-- disable virtual text
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
						}

						vim.diagnostic.config(config)

						vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
								border = "rounded",
								width = 60,
						})

						vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
								border = "rounded",
								width = 60,
						})
				end,
				on_attach = function(client, bufnr)
						function map(m, k, cmd)
								vim.keymap.set(m, k, cmd, { noremap=true, silent=true, buffer=bufnr })
						end

						map('n', 'K', vim.lsp.buf.hover)
						map({ 'n', 'v' }, '<leader>f', vim.lsp.buf.formatting)

						vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format{async=true}' ]])
				end,
				capabilities = capabilities
		}

		local has_custom_opts, server_custom_opts = pcall(require, "lsp_settings." .. server)

		if has_custom_opts then
				opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
		end

		lsp[server].setup(opts)
end

