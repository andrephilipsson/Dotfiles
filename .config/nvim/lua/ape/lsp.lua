-- Change signs that show up in sign-column
vim.fn.sign_define('LspDiagnosticsSignError', { text = '✖' })
vim.fn.sign_define('LspDiagnosticsSignWarning', { text = '⚠' })
vim.fn.sign_define('LspDiagnosticsSignInformation', { text = 'ℹ' })
vim.fn.sign_define('LspDiagnosticsSignHint', { text = '➤' })

local lsp = {}


local nnoremap = function (lhs, rhs)
  vim.api.nvim_buf_set_keymap(0, 'n', lhs, rhs, {noremap = true, silent = true})
end


local on_attach = function ()
  local mappings = {
    -- Show line diagnostics in floating window
    ['<Leader>e'] = '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
    -- Jumps to the definition of the symbol under the cursor
    ['gd'] = '<cmd>lua vim.lsp.buf.definition()<CR>',
    -- Opens a floating window with the definition of the symbol under the cursor
    ['K'] = '<cmd>lua vim.lsp.buf.hover()<CR>',
    -- Opens a quickfix listing with all references to the symbol under the cursor
    ['gr'] = '<cmd>lua vim.lsp.buf.references()<CR>',
    -- Rename the symbol under the cursor
    ['<Leader>rn'] = '<cmd>lua require("lspsaga.rename").rename()<CR>',
  }

  for lhs, rhs in pairs(mappings) do
    nnoremap(lhs, rhs)
  end

  vim.api.nvim_win_set_option(0, 'signcolumn', 'yes')
end


lsp.bind = function ()
  pcall(function ()
    if vim.api.nvim_win_get_var(0, 'textDocument/hover') then
      nnoremap('K', ':call nvim_win_close(0, v:true)<CR>')
      nnoremap('<Esc>', ':call nvim_win_close(0, v:true)<CR>')

      vim.api.nvim_win_set_option(0, 'cursorline', false)
    end
  end)
end


lsp.init = function ()

  -- Python Language Server
  require'lspconfig'.pyls.setup{
    on_attach = on_attach
  }

  -- Vue Language Server
  require'lspconfig'.vuels.setup{
    on_attach = on_attach
  }

  -- Tex Language Server
  require'lspconfig'.texlab.setup{
    on_attach = on_attach,
    settings = {
      latex = {
        build = {
          args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
          executable = "latexmk",
          onSave = true
        }
      }
    }
  }

  -- Java Language Server
  require'lspconfig'.jdtls.setup{
    on_attach = on_attach,
    root_dir = require'lspconfig'.util.root_pattern('settings.gradle', '.git')
  }

  -- Kotlin Language Server
  require'lspconfig'.kotlin_language_server.setup{
    on_attach = on_attach
  }

  -- R Language Server
  require'lspconfig'.r_language_server.setup{
    on_attach = on_attach
  }

  -- Typescript Language Server
  require'lspconfig'.tsserver.setup{
    on_attach = on_attach
  }

  -- Lua Language Server
  local cmd = vim.fn.expand(
    'lua-language-server'
  )
  require'lspconfig'.sumneko_lua.setup{
    cmd = { cmd },
    on_attach = on_attach,
    settings = {
      Lua = {
        diagnostics = {
          enable = true,
          globals = {'vim'}
        }
      }
    }
  }
end


lsp.set_up_highlights = function ()
  local pinnacle = require'wincent.pinnacle'

  vim.cmd('highlight LspDiagnosticsError ' .. pinnacle.decorate('italic,underline', 'ModeMsg'))

  vim.cmd('highlight LspDiagnosticsHint ' .. pinnacle.decorate('bold,italic,underline', 'Type'))

  vim.cmd('highlight LspDiagnosticsHintSign ' .. pinnacle.highlight({
    bg = pinnacle.extract_bg('ColorColumn'),
    fg = pinnacle.extract_fg('Type'),
  }))

  vim.cmd('highlight LspDiagnosticsErrorSign ' .. pinnacle.highlight({
    bg = pinnacle.extract_bg('ColorColumn'),
    fg = pinnacle.extract_fg('ErrorMsg'),
  }))
end

return lsp
