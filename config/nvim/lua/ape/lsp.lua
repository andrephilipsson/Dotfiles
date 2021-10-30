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
  local lspconfig = require("lspconfig")
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

  capabilities.textDocument.completion.completionItem.snippetSupport = true

  lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
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

    -- metals_config.init_options.statusBarProvider = "on"

    metals_config.handlers["textDocument/publishDiagnostics"] = shared_diagnostic_settings

    metals_config.on_attach = function()
      require("metals").setup_dap()
    end

    metals_config.capabilities = capabilities

    return metals_config
  end

  lspconfig.pyright.setup({})
  lspconfig.vuels.setup({})
  lspconfig.kotlin_language_server.setup({})
  lspconfig.r_language_server.setup({})
  lspconfig.tsserver.setup({})
  lspconfig.clojure_lsp.setup({})
  lspconfig.clangd.setup({})
  lspconfig.tailwindcss.setup{}

  lspconfig.texlab.setup{
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

  local luadev = require("lua-dev").setup({
    lspconfig = {
      cmd = {"lua-language-server"}
    },
  })
  lspconfig.sumneko_lua.setup(luadev)
end

local finders = require'telescope.finders'
local sorters = require'telescope.sorters'
local actions = require'telescope.actions'
local pickers = require'telescope.pickers'
require('jdtls.ui').pick_one_async = function(items, prompt, label_fn, cb)
  local opts = {}
  pickers.new(opts, {
    prompt_title = prompt,
    finder    = finders.new_table {
      results = items,
      entry_maker = function(entry)
        return {
          value = entry,
          display = label_fn(entry),
          ordinal = label_fn(entry),
        }
      end,
    },
    sorter = sorters.get_generic_fuzzy_sorter(),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local selection = actions.get_selected_entry(prompt_bufnr)
        actions.close(prompt_bufnr)

        cb(selection.value)
      end)

      return true
    end,
  }):find()
end

return lsp
