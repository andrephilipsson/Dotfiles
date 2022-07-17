local M = {}

local has_lspconfig, lspconfig = pcall(require, "lspconfig")
if not has_lspconfig then
  return
end

M.on_attach = function(client, bufnr)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = true })
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = true })
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = true })
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = true })
  vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, { buffer = true })
  vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, { buffer = true })
  vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, { buffer = true })
  vim.keymap.set("n", "<Leader>a", vim.lsp.buf.code_action, { buffer = true })
  vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = true })
  vim.api.nvim_create_user_command("Format", function()
    vim.lsp.buf.format({ async = true })
  end, {})

  vim.wo.signcolumn = "yes:1"

  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = "if_many",
        prefix = " ",
        scope = "cursor",
      }
      vim.diagnostic.open_float(nil, opts)
    end,
  })

  if client.server_capabilities.documentHighlightProvider then
    vim.cmd([[
      hi! LspReferenceRead cterm=bold ctermbg=red guibg=LightBlue
      hi! LspReferenceText cterm=bold ctermbg=red guibg=LightBlue
      hi! LspReferenceWrite cterm=bold ctermbg=red guibg=LightBlue
    ]])
    vim.api.nvim_create_augroup("lsp_document_highlight", {
      clear = false,
    })
    vim.api.nvim_clear_autocmds({
      buffer = bufnr,
      group = "lsp_document_highlight",
    })
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = "lsp_document_highlight",
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      group = "lsp_document_highlight",
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

M.handlers = function()
  return {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
    ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      -- virtual_text = {
      --   spacing = 2,
      --   prefix = "●",
      -- },
      virtual_text = false,
      underline = true,
      update_in_insert = false,
    }),
  }
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
local has_cmp_lsp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if has_cmp_lsp then
  M.capabilities = cmp_lsp.update_capabilities(M.capabilities)
end

lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
  handlers = M.handlers(),
  capabilities = M.capabilities,
  on_attach = M.on_attach,
})

local servers = {
  "tsserver",
  "tailwindcss",
  "pyright",
  "hls",
  "kotlin_language_server",
}
for _, lsp in pairs(servers) do
  lspconfig[lsp].setup({})
end

local has_luadev, luadev = pcall(require, "lua-dev")
if has_luadev then
  lspconfig["sumneko_lua"].setup(luadev.setup())
else
  lspconfig["sumneko_lua"].setup({})
end

lspconfig["texlab"].setup({
  settings = {
    latex = {
      build = {
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
        executable = "latexmk",
        onSave = true,
      },
    },
  },
})

return M
