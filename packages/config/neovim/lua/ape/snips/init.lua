local snippets = require("snippets")
local U = require("snippets.utils")

local snips = {}

snips._global = {
  date = "${=os.date('%Y-%m-%d')}",
  todo = U.force_comment("TODO: "),
  fixme = U.force_comment("FIXME: "),
};

snips.python = require"ape.snips.python"
snips.html = require"ape.snips.html"
snips.vue = require"ape.snips.vue"
snips.java = require"ape.snips.java"
snips.markdown = require"ape.snips.markdown"
snips.typescriptreact = require"ape.snips.typescriptreact"
snips.anki_deck = require"ape.snips.anki_deck"

snippets.snippets = snips
