local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
	-- Mappings.
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	--buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	--vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	--buf_set_keymap("i", "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	--buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").default_capabilities()

capabilities.textDocument.completion.completionItem = {
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

nvim_lsp.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	cmd = { "typescript-language-server", "--stdio" },
})

nvim_lsp.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

nvim_lsp.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
nvim_lsp.emmet_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
nvim_lsp.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
nvim_lsp.jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
nvim_lsp.marksman.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
nvim_lsp.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
nvim_lsp.sourcekit.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
nvim_lsp.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
nvim_lsp.astro.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
nvim_lsp.docker_compose_language_service.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
nvim_lsp.dockerls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
nvim_lsp.yamlls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signature_help"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = false,
	update_in_insert = true,
	virtual_text = { spacing = 4, prefix = "●" },
	severity_sort = true,
})

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
	},
	update_in_insert = true,
	float = {
		source = "always", -- Or "if_many"
	},
})
