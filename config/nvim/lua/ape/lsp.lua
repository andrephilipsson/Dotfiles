local lsp = {}

local nnoremap = function (lhs, rhs)
  vim.api.nvim_buf_set_keymap(0, 'n', lhs, rhs, {noremap = true, silent = true})
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


lsp.setup = function ()
  local shared_diagnostic_settings = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
  )
  local lsp_config = require("lspconfig")
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  capabilities.textDocument.completion.completionItem.snippetSupport = true

  lsp_config.util.default_config = vim.tbl_extend("force", lsp_config.util.default_config, {
    handlers = {
      ["textDocument/publishDiagnostics"] = shared_diagnostic_settings,
    },
    capabilities = capabilities,
  })


  Metals_config = function()
    local metals_config = require("metals").bare_config

    metals_config.settings = {
       showImplicitArguments = true
    }

    metals_config.init_options.statusBarProvider = "on"

    metals_config.handlers["textDocument/publishDiagnostics"] = shared_diagnostic_settings

    metals_config.on_attach = function()
      require("metals").setup_dap()
    end

    metals_config.capabilities = capabilities

    return metals_config
  end

  lsp_config.pyright.setup({})
  lsp_config.vuels.setup({})
  lsp_config.kotlin_language_server.setup({})
  lsp_config.r_language_server.setup({})
  lsp_config.tsserver.setup({})
  lsp_config.clojure_lsp.setup({})
  lsp_config.clangd.setup({})
  lsp_config.tailwindcss.setup{}

  lsp_config.jdtls.setup{
    root_dir = require("lspconfig").util.root_pattern("settings.gradle", ".git")
  }

  lsp_config.texlab.setup{
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

  local cmd = vim.fn.expand(
    "lua-language-server"
  )
  lsp_config.sumneko_lua.setup{
    cmd = { cmd },
    settings = {
      Lua = {
        diagnostics = {
          enable = true,
          globals = {"vim"}
        }
      }
    }
  }
end

return lsp
