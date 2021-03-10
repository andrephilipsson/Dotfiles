lua require'ape.lsp'.init()

" Change signs that show up in sign-column
sign define LspDiagnosticsSignError text=✖
sign define LspDiagnosticsSignWarning text=⚠
sign define LspDiagnosticsSignInformation text=ℹ
sign define LspDiagnosticsSignHint text=➤

augroup ApeLanguageClientAutocmds
  autocmd!
  autocmd ColorScheme * lua require'ape.lsp'.set_up_highlights()
  autocmd WinEnter * lua require'ape.lsp'.bind()
augroup END
