local has_neodev, neodev = pcall(require, "neodev")
if has_neodev then
	neodev.setup()
end

local has_fidget, fidget = pcall(require, "fidget")
if has_fidget then
	fidget.setup()
end

local has_lspconfig, lspconfig = pcall(require, "lspconfig")
local has_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if not has_lspconfig or not has_cmp then
	return
end

-- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

local on_attach = function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	local has_telescope, builtin = pcall(require, "telescope.builtin")
	if has_telescope then
		nmap("gr", builtin.lsp_references, "[G]oto [R]eferences")
		nmap("<leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
		nmap("<leader>ws", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
	end

	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")

	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		if vim.lsp.buf.format then
			vim.lsp.buf.format()
		elseif vim.lsp.buf.formatting then
			vim.lsp.buf.formatting()
		end
	end, { desc = "Format current buffer with LSP" })
end

local has_mason, mason = pcall(require, "mason")
local has_mason_lsp, mason_lsp = pcall(require, "mason-lspconfig")
if not has_mason or not has_mason_lsp then
	return
end

-- Setup mason so it can manage external tooling
mason.setup()

-- Enable the following language servers
-- Feel free to add/remove any LSPs that you want here. They will automatically be installed
local servers = { "clangd", "rust_analyzer", "pyright", "tsserver", "sumneko_lua", "tailwindcss" }

-- Ensure the servers above are installed
mason_lsp.setup({
	ensure_installed = servers,
})

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_lsp.default_capabilities(capabilities)

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.sumneko_lua.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace",
			},
			workspace = {
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
})
