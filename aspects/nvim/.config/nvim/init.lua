-- load options
require("ape.options")

-- load global options
require("ape.globals")

-- load global utils
require("ape.util.globals")

-- don't load any plugins if packer is not installed
if require("ape.first_load")() then
  return
end

-- speed up starup, must be loaded before any plugins are loaded
--require("impatient")

-- setup colors
require("ape.colors")

-- load plugins file
require("ape.plugins")

-- setup completion
require("ape.completion")

-- statusline
-- require("ape.statusline")

-- load lsp config
require("ape.lsp").setup()

-- setup nvim-dap for debugging
require("ape.dap")

-- setup treesitter
require("ape.treesitter")

-- load snippets
require("ape.snips")
