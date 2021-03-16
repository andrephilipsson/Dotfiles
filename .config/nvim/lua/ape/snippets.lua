local snippets = require'snippets'
local U = require'snippets.utils'

snippets.set_ux(require'snippets.inserters.vim_input')

local snips = {}

snips._global = {
  date = "${=os.date('%Y-%m-%d')}",
  todo = U.force_comment("TODO: "),
  fixme = U.force_comment("FIXME: "),
};

snips.python = require'../snippets/python'
snips.html = require'../snippets/html'
snips.vue = require'../snippets/vue'
snips.java = require'../snippets/java'
snips.markdown = require'../snippets/markdown'

snippets.snippets = snips
