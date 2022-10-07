require('mason').setup()

local installer = require('mason-lspconfig')
local lsp = require('lspconfig')
local inlayhints = require('lsp-inlayhints').on_attach
local map = require('util').map
local autocmd = require('util').autocmd
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = {
    'sumneko_lua', -- Lua
    'tsserver', -- Typescript/Javascript
    'jsonls', -- JSON
    'bashls', -- Bash/ZSH
    'pyright', -- Python
    'denols', -- Deno
}

installer.setup({
    ensure_installed = servers,
    automatic_installation = true
})


local signs = {
    { name = 'DiagnosticSignError', text = '' },
    { name = 'DiagnosticSignWarn', text = '' },
    { name = 'DiagnosticSignHint', text = '' },
    { name = 'DiagnosticSignInfo', text = '' },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
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
        on_attach = function(client, buffer)
            inlayhints(client, buffer)

            map('n', 'D', vim.diagnostic.open_float, buffer)
            map('n', 'K', vim.lsp.buf.hover, buffer)

            -- Format
            map('n', '<leader>f', vim.lsp.buf.formatting, buffer)

            -- Code Action
            map('n', '<leader>ca', vim.lsp.buf.code_action, buffer)

            -- Rename
            map('n', '<leader>rn', vim.lsp.buf.rename, buffer)


            if client.server_capabilities.documentHighlightProvider then
                autocmd("CursorHold", vim.lsp.buf.document_highlight, { buffer = buffer })
                autocmd("CursorMoved", vim.lsp.buf.clear_references, { buffer = buffer })
            end
        end,
        capabilities = capabilities
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

    local has_custom_opts, server_custom_opts = pcall(require, "servers." .. server)

    if has_custom_opts then
        opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
    end

    lsp[server].setup(opts)
end
