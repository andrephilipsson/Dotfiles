lua << END
  require"nvim_lsp".pyls.setup{}
  require"nvim_lsp".metals.setup{}

  vim.api.nvim_win_set_option(0, 'signcolumn', 'yes')
END

sign define LspDiagnosticsErrorSign text=✖
sign define LspDiagnosticsWarningSign text=⚠
sign define LspDiagnosticsInformationSign text=ℹ
sign define LspDiagnosticsHintSign text=➤
