local metals_config = require'metals'.bare_config
metals_config.settings = {
   showImplicitArguments = true
}

metals_config.on_attach = function(client, bufnr)
  -- require'metals'.setup_dap()
  require'completion'.on_attach()
end

metals_config.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      prefix = 'ℹ',
    }
  }
)
