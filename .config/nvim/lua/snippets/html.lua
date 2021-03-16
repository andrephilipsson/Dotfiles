local indent = require'snippets.utils'.match_indentation

local html = {}

html.h1 = indent [[<h1>$0</h1>]]
html.h2 = indent [[<h2>$0</h2>]]
html.h3 = indent [[<h3>$0</h3>]]
html.h4 = indent [[<h4>$0</h4>]]
html.h5 = indent [[<h5>$0</h5>]]
html.h6 = indent [[<h6>$0</h6>]]
html.p = indent [[<p>$0</p>]]
html.span = [[<span>$0</span>]]
html.div = indent [[
<div>
  $0
</div>]]

return html
