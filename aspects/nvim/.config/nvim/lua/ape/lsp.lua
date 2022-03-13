local lsp = {}

local shared_diagnostic_settings = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = {
    spacing = 4,
  },
  underline = true,
  update_in_insert = false,
})

lsp.on_attach = function()
  vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
  vim.keymap.set("n", "K", vim.lsp.buf.hover)
  vim.keymap.set("n", "gr", vim.lsp.buf.references)
  vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename)
  vim.keymap.set("n", "<Leader>a", vim.lsp.buf.code_action)

  vim.wo.signcolumn = "yes:1"
end

lsp.handlers = function()
  local border = {
    { "🭽", "FloatBorder" },
    { "▔", "FloatBorder" },
    { "🭾", "FloatBorder" },
    { "▕", "FloatBorder" },
    { "🭿", "FloatBorder" },
    { "▁", "FloatBorder" },
    { "🭼", "FloatBorder" },
    { "▏", "FloatBorder" },
  }

  return {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
    ["textDocument/publishDiagnostics"] = shared_diagnostic_settings,
  }
end

lsp.capabilities = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  return capabilities
end

lsp.setup = function()
  local lspconfig = require("lspconfig")

  lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
    handlers = lsp.handlers(),
    capabilities = lsp.capabilities(),
    on_attach = lsp.on_attach,
  })

  Metals_config = function()
    local metals_config = require("metals").bare_config()

    metals_config.settings = {
      showImplicitArguments = true,
      showInferredType = true,
      showImplicitConversionsAndClasses = true,
    }

    metals_config.init_options.statusBarProvider = "on"

    require("metals").setup_dap()

    metals_config.on_attach = lsp.on_attach
    metals_config.capabilities = lsp.capabilities()
    metals_config.handlers = lsp.handlers()

    return metals_config
  end

  lspconfig.clangd.setup({})
  lspconfig.pyright.setup({})
  lspconfig.volar.setup({})
  lspconfig.kotlin_language_server.setup({})
  lspconfig.tsserver.setup({})
  lspconfig.tailwindcss.setup({})
  lspconfig.dartls.setup({})
  lspconfig.solargraph.setup({})
  -- lspconfig.sorbet.setup({})

  lspconfig.texlab.setup({
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

  local luadev = require("lua-dev").setup({
    lspconfig = {
      cmd = { "lua-language-server" },
    },
  })
  lspconfig.sumneko_lua.setup(luadev)
end

return lsp
