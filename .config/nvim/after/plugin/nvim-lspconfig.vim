lua << END
  -- TODO: Make this dynamic
  -- TODO: Only show signcolumn in buffers where a lsp server is active
  vim.api.nvim_win_set_option(0, 'signcolumn', 'yes')

  -- Python Language Server
  require'lspconfig'.pyls.setup{}

  -- Vue Language Server
  require'lspconfig'.vuels.setup{}

  -- Tex Language Server
  require'lspconfig'.texlab.setup{}

  -- Java Language Server
  local lspconfig = require'lspconfig'
  require'lspconfig'.jdtls.setup{
     root_dir = lspconfig.util.root_pattern('settings.gradle')
  }

  -- Kotlin Language Server
  require'lspconfig'.kotlin_language_server.setup{}
END


" Change signs that show up in sign-column
sign define LspDiagnosticsErrorSign text=✖
sign define LspDiagnosticsWarningSign text=⚠
sign define LspDiagnosticsInformationSign text=ℹ
sign define LspDiagnosticsHintSign text=➤

" LSP mappings
" Jumps to the definition of the symbol under the cursor
nnoremap <silent> gd          <cmd>lua vim.lsp.buf.definition()<CR>
" Opens a floating window with the definition of the symbol under the cursor
nnoremap <silent> K           <cmd>lua vim.lsp.buf.hover()<CR>
" Opens a quickfix listing with all references to the symbol under the cursor
nnoremap <silent> gr          <cmd>lua vim.lsp.buf.references()<CR>
" Rename the symbol under the cursor on all occurrences
nnoremap <silent> <leader>rn  <cmd>lua vim.lsp.buf.rename()<CR>
" Show line diagnostics in floating window
nnoremap <silent> <leader>e  <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
" Rename the symbol under the cursor
nnoremap <silent> <space>rn <cmd>lua vim.lsp.buf.rename()<CR>
